package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.dao.MovieDao;
import bitcamp.java110.cms.dao.SceneReviewDao;
import bitcamp.java110.cms.domain.Movie;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.service.SceneReviewService;
import info.movito.themoviedbapi.model.MovieDb;

@Service
public class SceneReviewServiceImpl implements SceneReviewService {
  
  @Autowired SceneReviewDao sceneReviewDao;
  @Autowired MovieDao movieDao;
  
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  @Override
  public void add(SceneReview sceneReview) {
    
    Movie movie = sceneReview.getMovie();
    if(movie.getMvno() !=0 &&  movieDao.findByNo(movie.getMvno()) == null) {
      movieDao.insertByObj(movie);
    }
    
    sceneReviewDao.insert(sceneReview);
  }
  
  @Override
  public List<SceneReview> list(int mvno) {
    return sceneReviewDao.list(mvno);
  }
  
  @Override
  public SceneReview initSceneReview(MovieDb tmdbMovie, SceneReview sr) {
    
    // 장면 시간 설정
    if (sr.getTime() == null) {
      sr.setTime(sceneReviewDao.findDefaultTime(tmdbMovie.getId()));
    }
    
    Map<String, Object> condition = new HashMap<>();
    condition.put("mvno", tmdbMovie.getId());
    condition.put("time", sr.getTime());
    
    SceneReview findMovie = sceneReviewDao.findByTime(condition);
    if (findMovie != null) {
      sr = findMovie;
    }
    sr.setMovieDb(tmdbMovie);
    
    return sr;
  }
  
  
}
