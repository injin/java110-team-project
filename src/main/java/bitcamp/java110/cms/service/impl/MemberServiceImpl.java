package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.dao.FavGenreDao;
import bitcamp.java110.cms.dao.FlwDao;
import bitcamp.java110.cms.dao.MemberDao;
import bitcamp.java110.cms.dao.MlogDao;
import bitcamp.java110.cms.dao.MovieAnlyDao;
import bitcamp.java110.cms.dao.MovieDao;
import bitcamp.java110.cms.dao.PostCmtDao;
import bitcamp.java110.cms.dao.PostDao;
import bitcamp.java110.cms.dao.PostHashtagDao;
import bitcamp.java110.cms.dao.ReportDao;
import bitcamp.java110.cms.dao.SceneAlbumDao;
import bitcamp.java110.cms.dao.SceneReviewDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.MemberService;
import info.movito.themoviedbapi.TmdbApi;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.model.Genre;
import info.movito.themoviedbapi.model.MovieDb;

@Service
public class MemberServiceImpl implements MemberService {
  
  @Autowired MemberDao memberDao;
  @Autowired FavGenreDao favGenreDao;
  @Autowired MovieDao movieDao;
  @Autowired MovieAnlyDao movieAnlyDao;
  @Autowired FlwDao flwDao;
  @Autowired MlogDao logDao;
  @Autowired PostDao postDao;
  @Autowired PostCmtDao postCmtDao;
  @Autowired PostHashtagDao tagDao;
  @Autowired ReportDao rptDao;
  @Autowired SceneAlbumDao lbmDao;
  @Autowired SceneReviewDao rvDao;
  
  @Autowired Environment env;
  @Autowired TmdbMovies tmdbMovies;
  @Autowired MovieAnlyDao mvAnlyDao;
  
  @Transactional(propagation=Propagation.REQUIRED,
                  rollbackFor=Exception.class)
  @Override
  public void add (Member member) {
    memberDao.insert(member);
  }

  @Override
  public Member findById (String id) {
    // TODO Auto-generated method stub
    return null;
  }
  
  @Override
  public List<Member> findByNick(String keyword) {
    return memberDao.findByNick(keyword);
  }
  
  @SuppressWarnings("null")
  @Transactional(propagation=Propagation.REQUIRED,
                 rollbackFor=Exception.class)
  @Override
  public void update(Member member) {
    System.out.println("Service Recieve Member\n :\t" + member);
    
    memberDao.update(member);
    List<Integer> originList = getFavGnrDBList(member.getMno());
    
    if (member.getFavGrList() != null && member.getFavGrList().size() > 0) {
      if(originList != null || originList.size() > 0) {
        favGenreDao.deleteAll(member.getMno());
      }
      for (int i = 0; i < member.getFavGrList().size(); i++) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("mno", member.getMno());
        params.put("grno", member.getFavGrList().get(i));
        favGenreDao.insert(params);
      }
    }
    
    if (member.getFavMvList() != null && member.getFavMvList().size() > 0) {
      for (int i = 0; i < member.getFavMvList().size(); i++) {
        //  mv_mv table에 insert
        movieDao.insertNotExists(member.getFavMvList().get(i));
        
        
        //  mv_mv_anly에 insert
        HashMap<String, Integer> params = new HashMap<>();
        params.put("mno", member.getMno());
        params.put("mvno", member.getFavMvList().get(i).getMvno());
        movieAnlyDao.insertNotExists(params);
        
        //  mv_mv_gr에 insert
        saveMvId(member.getFavMvList().get(i).getMvno());
      }
    }
  }
  
  protected void saveMvId (int mvno) {
    String tmdbKey = env.getProperty("tmdb.key");
    
    tmdbMovies = new TmdbApi(tmdbKey).getMovies();
    MovieDb mvdb = tmdbMovies.getMovie(mvno, Constants.LANGUAGE_KO);
    List <Genre> genres = mvdb.getGenres();
    Map <String, Integer> params = new HashMap<>();
    if(genres.size() > 0) {
      for(Genre g : genres) {
        params.put("mvno", mvdb.getId());
        params.put("grno", g.getId());
        mvAnlyDao.insertGrNotExists(params);
      }
    }
  }
  
  /**
   * !!주석 삭제 금지!!
   * 제하 To Do
   * !! sginOut 할 때 DB관리
   */
  @Override
  public void signOut(int mno) {
    System.out.println(mno + "\nSignOut Process 1");
    rvDao.signOut(mno);
    System.out.println("SignOut Process 2");
    lbmDao.signOut1(mno);
    lbmDao.signOut2(mno);
    lbmDao.signOut3(mno);
    System.out.println("SignOut Process 3");
    rptDao.signOut(mno);
    tagDao.signOut(mno);
    System.out.println("SignOut Process 4");
    postCmtDao.signOut(mno);
    System.out.println("SignOut Process 5");
    postDao.signOut(mno);
    System.out.println("SignOut Process 6");
    logDao.signOut1(mno);
    logDao.signOut2(mno);
    flwDao.signOut1(mno);
    flwDao.signOut2(mno);
    System.out.println("SignOut Process 7");
    movieAnlyDao.signOut(mno);
    favGenreDao.signOut(mno);
    memberDao.signOut(mno);
    System.out.println("END?");
    
  }
  
  @Override
  public List<Integer> getFavGnrDBList(int mno){
    return favGenreDao.getFavGnrList(mno);
  }
  
  @Override
  public List<Integer> getFavMvDBList(int mno){
    return null;
  }
}
