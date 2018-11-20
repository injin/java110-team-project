package bitcamp.java110.cms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import bitcamp.java110.cms.common.Constants;
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
  

  @Override
  public Map<String, Object> getMap(int thmno) {
    String thmTitle = rcmdDao.getTitle(thmno);
    List<Integer> idList = rcmdDao.findMgrRcmdListById(thmno);
    
    List<MovieDb> mvList = new ArrayList<>();
    Map<String, Object> mvMap = new HashMap<>();
    
    for (int i = 0; i < idList.size(); i++) {
      int id = (int)idList.get(i);
      MovieDb mv = getMvById(id);
      mvList.add(mv);
    }
    /*
    //  test print
    for (int i = 0; i < mvList.size(); i ++) {
      System.out.println();
      System.out.println("mvdb : " + mvList.get(i).toString());
      System.out.println("BackdropPath : " + mvList.get(i).getBackdropPath());
      System.out.println("Overview : " + mvList.get(i).getOverview());
      System.out.println("ReleaseDate : " + mvList.get(i).getReleaseDate());
      System.out.println("Runtime : " + mvList.get(i).getRuntime());
      System.out.println("VoteAverage : " + mvList.get(i).getVoteAverage());
      System.out.println();
    }
    */
    mvMap.put(thmTitle, mvList);
    
    return mvMap;
  }
  
  @Override
  public String getListName(int thmno) {
    return rcmdDao.getTitle(thmno);
  }
  
  @Override
  public List<MovieDb> getList(int thmno){
    List<Integer> idList = rcmdDao.findMgrRcmdListById(thmno);;
    List<MovieDb> mvList = new ArrayList<>(); 
    
    for (int i = 0; i < idList.size(); i++) {
      int id = (int)idList.get(i);
      MovieDb mv = getMvById(id);
      mvList.add(mv);
    }
    
    /*
    //  test print
    for (int i = 0; i < mvList.size(); i ++) {
      System.out.println();
      System.out.println("mvdb : " + mvList.get(i).toString());
      System.out.println("BackdropPath : " + mvList.get(i).getBackdropPath());
      System.out.println("Overview : " + mvList.get(i).getOverview());
      System.out.println("ReleaseDate : " + mvList.get(i).getReleaseDate());
      System.out.println("Runtime : " + mvList.get(i).getRuntime());
      System.out.println("VoteAverage : " + mvList.get(i).getVoteAverage());
      System.out.println();
    }
    */
    
    return mvList;
  }

  @Override
  public MovieDb getMvById(int mvno) {
    String tmdbKey = env.getProperty("tmdb.key");
    
    tmdbMovies = new TmdbApi(tmdbKey).getMovies();
    MovieDb mvdb = tmdbMovies.getMovie(mvno, Constants.LANGUAGE_KO);
    
    System.out.println("mvdb : " + mvdb.toString());
    
    /*
    //  test print
    System.out.println();
    System.out.println("BackdropPath : " + mvdb.getBackdropPath());
    System.out.println("Overview : " + mvdb.getOverview());
    System.out.println("ReleaseDate : " + mvdb.getReleaseDate());
    System.out.println("Runtime : " + mvdb.getRuntime());
    System.out.println("VoteAverage : " + mvdb.getVoteAverage());
    System.out.println();
    */
    
    return mvdb;
  }

  
}
