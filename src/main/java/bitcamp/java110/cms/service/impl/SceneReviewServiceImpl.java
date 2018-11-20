package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.dao.MlogDao;
import bitcamp.java110.cms.dao.MovieDao;
import bitcamp.java110.cms.dao.SceneReviewDao;
import bitcamp.java110.cms.domain.Mlog;
import bitcamp.java110.cms.domain.Movie;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.service.SceneReviewService;
import info.movito.themoviedbapi.model.MovieDb;

@Service
public class SceneReviewServiceImpl implements SceneReviewService {
  
  @Autowired SceneReviewDao sceneReviewDao;
  @Autowired MovieDao movieDao;
  @Autowired MlogDao logDao;
  
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  @Override
  public void add(SceneReview sceneReview) {
    
    // 영화 체크 및 입력
    Movie movie = sceneReview.getMovie();
    if(movie.getMvno() !=0 &&  movieDao.findByNo(movie.getMvno()) == null) {
      movieDao.insertByObj(movie);
    }
    
    // 장면리뷰 입력
    sceneReviewDao.insert(sceneReview);
    
    // 로그 입력
    Mlog mlog = new Mlog();
    mlog.setMno(sceneReview.getMno());
    mlog.setDirect(Constants.LOG_DO_TYPE_SR);
    mlog.setIndirect(sceneReview.getMovie().getTitle());
    mlog.setAct(Constants.LOG_ACT_TYPE_WR);
    mlog.setUrl("/app/sceneReview/review?mvno=" + sceneReview.getMvno() 
                + "&time=" + sceneReview.getTime());
    logDao.insert(mlog);
  }
  
  @Override
  public SceneReview findByTime(int mvno, String time) {
    Map<String, Object> condition = new HashMap<>();
    condition.put("mvno", mvno);
    condition.put("time", time);
    
    return sceneReviewDao.findByTime(condition);
  }
  
  @Override
  public SceneReview findByNo(int srno) {
    return sceneReviewDao.findByNo(srno);
  }
  
  @Override
  public List<SceneReview> list(int mvno) {
    return sceneReviewDao.list(mvno);
  }
  
  @Override
  public SceneReview initSceneReview(MovieDb tmdbMovie, SceneReview sr) {
    
    // 영화 정보 설정
    sr.setMovieDb(tmdbMovie);
    
    // 장면 시간 설정
    if (sr.getTime() == null) {
      String defaultTime = sceneReviewDao.findDefaultTime(tmdbMovie.getId());
      if (defaultTime != null) {
        sr.setTime(sceneReviewDao.findDefaultTime(tmdbMovie.getId()));
      } else {
        return sr;
      }
    }
    
    SceneReview findMovie = findByTime(tmdbMovie.getId(), sr.getTime());
    if (findMovie != null) {
      findMovie.setTrgtSrExist(true);
      sr = findMovie;
    } else {
      sr.setTrgtSrExist(false);
    }
    
    return sr;
  }
  
}
