package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.common.Paging;
import bitcamp.java110.cms.dao.MlogDao;
import bitcamp.java110.cms.dao.MovieDao;
import bitcamp.java110.cms.dao.SceneReviewDao;
import bitcamp.java110.cms.domain.Mlog;
import bitcamp.java110.cms.domain.Movie;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.domain.SceneReviewCmt;
import bitcamp.java110.cms.domain.SceneReviewMap;
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
  
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  @Override
  public void addCmt(SceneReviewCmt sceneReviewCmt) {
    sceneReviewDao.insertCmt(sceneReviewCmt);
    
    SceneReviewMap map = sceneReviewCmt.getMap();
    map.setCmno(sceneReviewCmt.getCmno());
    if (map.getLat() != null && map.getLng() != null) {
      sceneReviewDao.insertCmtMap(map);
    }
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
  public int getTotalCmtCnt(int srno) {
    return sceneReviewDao.getTotalCmtCnt(srno);
  }
  
  @Override
  public List<SceneReviewCmt> listCmt(int srno, Paging paging) {
    Map<String, Object> condition = new HashMap<>();
    condition.put("srno", srno);
    condition.put("paging", paging);
    return sceneReviewDao.listCmt(condition);
  }
  
  @Override
  public List<SceneReview> listTopSr() {
    return sceneReviewDao.listTopSr();
  }
  
  @Override
  public SceneReview initSceneReview(MovieDb tmdbMovie, SceneReview sr) {
    
    // 영화 정보 설정
    sr.setMovieDb(tmdbMovie);
    
    if (sr.getSrno() == null) {
      Integer defaultSrno = sceneReviewDao.findOne(tmdbMovie.getId());
      if (defaultSrno != null) {
        sr.setSrno(defaultSrno);
      } else {
        return sr;
      }
    }
    
    SceneReview findSr = findByNo(sr.getSrno());
    if (findSr != null) {
      findSr.setTrgtSrExist(true);
      sr = findSr;
    } else {
      sr.setTrgtSrExist(false);
    }
    
    return sr;
  }
  
}
