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
import bitcamp.java110.cms.dao.ReportDao;
import bitcamp.java110.cms.dao.SceneAlbumDao;
import bitcamp.java110.cms.dao.SceneReviewDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.SceneAlbum;
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
  @Autowired ReportDao rptDao;
  @Autowired SceneAlbumDao lbmDao;
  @Autowired SceneReviewDao srDao;
  
  @Autowired Environment env;
  @Autowired TmdbMovies tmdbMovies;
  @Autowired MovieAnlyDao mvAnlyDao;
  
  @Transactional(propagation=Propagation.REQUIRED,
                  rollbackFor=Exception.class)
  @Override
  public void add (Member member) {
    memberDao.insert(member);
    Map<String, Object> condition = new HashMap<>();
    condition.put("mno", member.getMno());
    condition.put("sceneAlbum", new SceneAlbum("기본 앨범", true));
    System.out.println("장면앨범 default 추가: "+lbmDao.insert(condition));
  }
  
  @Override
  public List<Member> findByNick(String keyword) {
    return memberDao.findByNick(keyword);
  }
  
  @SuppressWarnings("null")
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  @Override
  public boolean init(Member member) {
    boolean result = false;
    if (memberDao.update(member) > 0) {
      
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
      result = true;
    }
    return result;
  }
  
  @Override
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  public boolean update(Member member) {
    boolean result = false;
    
    if (memberDao.update(member) > 0) {
      result = true;
      List<Integer> originList = getFavGnrDBList(member.getMno());
      if (member.getFavGrList() != null && member.getFavGrList().size() > 0) {
        if(originList != null && originList.size() > 0) {
          favGenreDao.deleteAll(member.getMno());
        }
        for (int i = 0; i < member.getFavGrList().size(); i++) {
          HashMap<String, Object> params = new HashMap<>();
          params.put("mno", member.getMno());
          params.put("grno", member.getFavGrList().get(i));
          favGenreDao.insert(params);
        }
      }
    }
    return result;
  }
  
  @Override
  public void saveMvId(int mvno) {
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
    srDao.signOut1(mno);
    srDao.signOut2(mno);
    System.out.println("SignOut Process 2");
    lbmDao.signOut1(mno);
    lbmDao.signOut2(mno);
    lbmDao.signOut3(mno);
    System.out.println("SignOut Process 3");
    rptDao.signOut(mno);
    System.out.println("SignOut Process 4");
    postCmtDao.signOut(mno);
    System.out.println("SignOut Process 5");
    postDao.signOut(mno);
    System.out.println("SignOut Process 6");
    logDao.signOut1(mno);
    logDao.signOut2(mno);
    System.out.println("SignOut Process 7");
    flwDao.signOut3(mno);
    flwDao.signOut1(mno);
    flwDao.signOut2(mno);
    System.out.println("SignOut Process 8");
    movieAnlyDao.signOut(mno);
    favGenreDao.signOut(mno);
    System.out.println("LastProcess");
    memberDao.signOut(mno);
    System.out.println("Bye");
    
  }
  
  @Override
  public List<Integer> getFavGnrDBList(int mno){
    return favGenreDao.getFavGnrList(mno);
  }
  
  @Override
  public Member findByMno(int tgtMno) {
    return memberDao.findByMno(tgtMno);
  }
  
  
}
