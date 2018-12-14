package bitcamp.java110.cms.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.common.FileUtils;
import bitcamp.java110.cms.common.Paging;
import bitcamp.java110.cms.dao.MlogDao;
import bitcamp.java110.cms.dao.MovieAnlyDao;
import bitcamp.java110.cms.dao.MovieDao;
import bitcamp.java110.cms.dao.SceneAlbumDao;
import bitcamp.java110.cms.dao.SceneReviewDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.Mlog;
import bitcamp.java110.cms.domain.Movie;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.domain.SceneReviewCmt;
import bitcamp.java110.cms.domain.SceneReviewMap;
import bitcamp.java110.cms.service.SceneReviewService;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.model.Genre;
import info.movito.themoviedbapi.model.MovieDb;

@Service
public class SceneReviewServiceImpl implements SceneReviewService {
  
  @Autowired SceneReviewDao sceneReviewDao;
  @Autowired SceneAlbumDao sceneAlbumDao;
  @Autowired MovieDao movieDao;
  @Autowired MlogDao logDao;
  @Autowired MovieAnlyDao movieAnlyDao;
  @Autowired TmdbMovies tmdbMovies;
  
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
                + "&srno=" + sceneReview.getSrno());
    logDao.insert(mlog);
    
    // 영화분석 점수 추가
    HashMap<String, Object> mparams = new HashMap<>();
    mparams.put("mno", sceneReview.getMno());
    mparams.put("mvno", sceneReview.getMvno());
    mparams.put("pnt", 10);
    if (movieAnlyDao.findOne(mparams) > 0) {
      movieAnlyDao.update(mparams);
    } else {
      movieAnlyDao.insertPost(mparams);
    }
    
    // 영화 장르 추가
    if (!movieAnlyDao.checkGrExist(sceneReview.getMvno())) {
      List<Genre> genres = tmdbMovies.getMovie(sceneReview.getMvno(), Constants.LANGUAGE_KO).getGenres();
      List<Integer> grnoList = new ArrayList<>();
      if (genres.size() > 0) {
        for(Genre g: genres) {
          grnoList.add(g.getId());
        }
      }
      HashMap<String, Object> gparams = new HashMap<>();
      gparams.put("mvno", sceneReview.getMvno());
      gparams.put("grnoList", grnoList);
      movieAnlyDao.insertGrAllNotExists(gparams);
    }
  }
  
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  @Override
  public void addCmt(SceneReviewCmt sceneReviewCmt, SceneReview sceneReview) {
    // 댓글 입력
    sceneReviewDao.insertCmt(sceneReviewCmt);
    
    // 댓글 지도 입력
    SceneReviewMap map = sceneReviewCmt.getMap();
    if (map.getLat() != null && map.getLng() != null) {
      map.setCmno(sceneReviewCmt.getCmno());
      sceneReviewDao.insertCmtMap(map);
    }
    
    // 로그 입력
    Mlog mlog = new Mlog();
    mlog.setMno(sceneReviewCmt.getMno());
    mlog.setDirect(Constants.LOG_DO_TYPE_SC);
    mlog.setIndirect(sceneReviewCmt.getMvnm());
    mlog.setAct(Constants.LOG_ACT_TYPE_WR);
    mlog.setUrl("/app/sceneReview/review?mvno=" + sceneReview.getMvno() 
                  + "&srno=" + sceneReview.getSrno());
    logDao.insert(mlog);
    
    // 영화분석 점수 추가
    HashMap<String, Object> mparams = new HashMap<>();
    mparams.put("mno", sceneReviewCmt.getMno());
    mparams.put("mvno", sceneReview.getMvno());
    mparams.put("pnt", 5);
    if (movieAnlyDao.findOne(mparams) > 0) {
      movieAnlyDao.update(mparams);
    } else {
      movieAnlyDao.insertPost(mparams);
    }
  }
  
  @Override
  public SceneReview findByNo(int srno) {
    return sceneReviewDao.findByNo(srno);
  }
  
  @Override
  public List<SceneReviewCmt> getListByKeyword(String keyword) {
    return sceneReviewDao.getHashCmtByKeyword(keyword);
  }
  
  @Override
  public List<SceneReview> list(int mvno) {
    return sceneReviewDao.findAll(mvno);
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
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  public void deleteCmt(int cmno) {
    sceneReviewDao.deleteCmtMap(cmno);
    sceneReviewDao.deleteCmt(cmno);
  }
  
  @Override
  public void updateCmt(SceneReviewCmt sceneReviewCmt) {
    sceneReviewDao.updateCmt(sceneReviewCmt);
  }
  
  @Override
  public List<SceneReview> listTopSr() {
    return sceneReviewDao.listTopSr();
  }
  
  public List<SceneReview> listTopSrByCdt() {
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();
    
    List<SceneReview> result = new ArrayList<>();
    int cnt = 0;
    
    do {
      List<SceneReview> list = sceneReviewDao.listTopSrByCdt(sdf.format(cal.getTime()));
      result.addAll(list);
      if (result.size() > 8) {
        return result.subList(0, 8);
      } else {
        cal.add(Calendar.DATE, -3);
      }
    } while (cnt++ < 10);
    
    return result;
  }
  
  @Override
  public List<Member> listTopReviewer(int mvno) {
    return sceneReviewDao.listTopReviewer(mvno);
  }
  
  @Override
  public boolean addToSrAlbum(int lbmno, int srno) {
    Map<String, Object> condition = new HashMap<>();
    condition.put("lbmno", lbmno);
    condition.put("srno", srno);
    if (sceneReviewDao.addToSrAlbum(condition) > 0) {
      return true;
    } else {
      return false;
    }
  }
  
  @Override
  public boolean deleteFromSrAlbum(int lbmno, int srno) {
    Map<String, Object> condition = new HashMap<>();
    condition.put("lbmno", lbmno);
    condition.put("srno", srno);
    if (sceneReviewDao.deleteFromSrAlbum(condition) > 0) {
      return true;
    } else {
      return false;
    }
  }
  
  @Override
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  public boolean deleteSr(ServletContext sc, int srno) {
    
    // 이미지 삭제
    SceneReview trgtSr = sceneReviewDao.findByNo(srno);
    if (trgtSr == null) return false;
    FileUtils.deleteFile(sc.getRealPath("/upload/sceneReview/" + trgtSr.getPhoto()));
    
    Map<String, Object> params = new HashMap<>();
    params.put("srno", srno);
    List<SceneReviewCmt> trgtCmtList = sceneReviewDao.listCmt(params);
    if (trgtCmtList != null) {
      for (SceneReviewCmt cmt : trgtCmtList) {
        FileUtils.deleteFile(sc.getRealPath("/upload/sceneReview/" + cmt.getPhoto()));
      }
    }
    
    // 데이터 삭제
    sceneReviewDao.deleteCmtMapBySrno(srno);
    sceneReviewDao.deleteCmtBySrno(srno);
    sceneReviewDao.deleteLbmSr(srno);
    sceneReviewDao.deleteSr(srno);
    
    return true;
  }
  
  @Override
  public SceneReview initSceneReview(MovieDb tmdbMovie, SceneReview sr) {
    
    // 영화 정보 설정
    sr.setMovieDb(tmdbMovie);
    
    if (sr.getSrno() == null) {
      Integer defaultSrno = sceneReviewDao.findOneSrno(tmdbMovie.getId());
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
