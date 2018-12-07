package bitcamp.java110.cms.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.dao.MovieAnlyDao;
import bitcamp.java110.cms.dao.RecommendDao;
import bitcamp.java110.cms.domain.Theme;
import bitcamp.java110.cms.service.RecommendService;
import info.movito.themoviedbapi.TmdbApi;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.model.MovieDb;

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
  public int[] RandomNums(int root){
    int[] n = new int[2];
//    System.out.println("Random Range : " + root);
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
