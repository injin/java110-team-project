package bitcamp.java110.cms.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.dao.MovieAnlyDao;
import bitcamp.java110.cms.dao.RecommendDao;
import bitcamp.java110.cms.service.RecommendService;
import info.movito.themoviedbapi.TmdbApi;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.model.MovieDb;

/**
 * @author Jeaha
 * 영화 추천을 위한 QUARTET
 * 
 * 회원 영화 취향 분석 테이블 -> mv_mv_anly
 * 최초 등록한 영화는 10점씩 point를 줬음.
 * 활동 로그를 바탕으로 영화별 점수를 줘야 함.
 * 
 * 등록시 취향 장르 테이블 -> mv_memb_gr
 * 활동 로그를 바탕으로 회원 영화 취향 장르 분석 테이블 -> mv_gr_anly
 * 
 * 세 테이블을 분석해서 영화 추천을 해야 함.
 * 
 * 기존 기록에 있는 영화들 분석해서 취향 저격 영화 추천 해 주는 list 1개 출력.
 * 기존 기록에 있는 영화 기반 추천 list 2개 3개,
 * folow한 member 중 취향이 비슷한 member의 추천 리스트를 같이 추천해 주는 메소드 1개
 * 그리고 관리자 추천영화 리스트 다수가 있으면 좋을것 같음.
 * 
 * 연결된 source
 * RecommendMvController
 * recommend/recommend.jsp
 * RecormendService
 * RecormendServiceImple
 * RecommendDao
 * RecommendDao.xml
 */

@Service
public class RecommendServiceImple implements RecommendService {
  
  @Autowired RecommendDao rcmdDao;
  @Autowired Environment env;
  @Autowired TmdbMovies tmdbMovies;
  @Autowired MovieAnlyDao mvAnlyDao;
  
  @Override
  public String getListName(int thmno) {
    return rcmdDao.getTitle(thmno);
  }
  @Override
  public List<MovieDb> getList(int thmno){
    System.out.println("\nthmno : " + thmno);
    List<Integer> idList = rcmdDao.findMgrRcmdListById(thmno);;
    List<MovieDb> mvList = new ArrayList<>(); 
    System.out.println(idList.toString());
    for (int i = 0; i < idList.size(); i++) {
      int id = (int)idList.get(i);
      MovieDb mv = getMvById(id);
      mvList.add(mv);
    }
    
    System.out.println("Service return mvList");
    return mvList;
  }

  @Override
  public MovieDb getMvById(int mvno) {
    String tmdbKey = env.getProperty("tmdb.key");
    
    tmdbMovies = new TmdbApi(tmdbKey).getMovies();
    MovieDb mvdb = tmdbMovies.getMovie(mvno, Constants.LANGUAGE_KO);
    /* Test 
    System.out.println("mvdb : " + mvdb.toString());
    System.out.println(mvdb.getOverview());
    System.out.println(mvdb.getBackdropPath());
    System.out.println(mvdb.getRuntime());
    List <Genre> genres = mvdb.getGenres();
    Map <String, Integer> params = new HashMap<>();
    if(genres.size() > 0) {
      System.out.println(genres);
      for(Genre g : genres) {
        System.out.println(mvdb.getId() + ", " + g.getId());
        params.put("mvno", mvdb.getId());
        params.put("grno", g.getId());
        mvAnlyDao.insertGrNotExists(params);
      }
    }
    */
    return mvdb;
  }

  @Override
  public int getCount() {
    return rcmdDao.getCount();
  }
  
  @Override
  public int[] RandomNums(int root){
    int[] n = new int[2];
    
    System.out.println("Random Range : " + root);
    
    for (int i = 0; i < n.length; i++) {
      n[i] = (int)(Math.random() * root + 1);
      for (int j = 0; j <= i-1; j++) {
        if(n[i] == n[j]) {
          i--;
        }
      }
    }
    return n;
  }
}
