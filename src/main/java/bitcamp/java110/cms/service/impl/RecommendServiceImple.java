package bitcamp.java110.cms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.dao.MovieAnlyDao;
import bitcamp.java110.cms.dao.MovieDao;
import bitcamp.java110.cms.dao.RecommendDao;
import bitcamp.java110.cms.domain.Theme;
import bitcamp.java110.cms.service.RecommendService;
import info.movito.themoviedbapi.TmdbApi;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.model.MovieDb;

@Service
public class RecommendServiceImple implements RecommendService {
  
  @Autowired TmdbMovies tmdbMovies;
  @Autowired RecommendDao rcmdDao;
  @Autowired Environment env;
  @Autowired MovieAnlyDao anlyDao;
  @Autowired MovieDao mvDao;
  
  
  
  @Override
  public String getListName(int thmno) {
    return rcmdDao.getTitle(thmno);
  }
  
  @Override
  public List<Theme> getAllTitle() {
    return rcmdDao.getAllTitle();
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
  public int[] RandomNums(int root, int range){
    int[] n = new int[range];
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
  
  @Override
  public void getAnly(int mno) {
    /**
     * mv_mv_anly에서 top 5의 mvno를 가져온다.
     * mvno의 recommedations list를 뽑는다.
     * 통계에서 가장 높은 장르 1개(2개?)와 일치하는 mv들만 추린다.
     * 네티즌 평점이 일정수준 (얼마?) 이상인 작품을 고른다.
     * 최중 mv가 10개를 넘지 않게 한다.
     */
    String urlHead = "https://api.themoviedb.org/3/movie/";
    int seedNo = 65;
    String urlBody = "/recommendations?page=1&language=ko-KOR&api_key=";
    String urlTail = env.getProperty("tmdb.key");
    String URL = urlHead + seedNo + urlBody + urlTail;
    
    @SuppressWarnings("unchecked")
    Map<String, Object> response = new RestTemplate().getForObject(URL, Map.class);
    System.out.println(
        response.toString().replace("}", "}\n")
        .replace("title", "\n\tTITLE")
        .replace("vote_average", "\nVOTE"));
  }
}
