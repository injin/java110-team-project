package bitcamp.java110.cms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.dao.SceneReviewDao;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.service.SceneReviewService;
import info.movito.themoviedbapi.model.MovieDb;

@Service
public class SceneReviewServiceImpl implements SceneReviewService {
  
  @Autowired SceneReviewDao sceneReviewDao;
  
  @Override
  public void add(SceneReview sceneReview) {
    sceneReviewDao.insert(sceneReview);
  }
  
  @Override
  public SceneReview makeSceneCover(MovieDb tmdbMovie) {
    
    SceneReview cover = new SceneReview();
    if (tmdbMovie.getBackdropPath() != null) { // 0분 0초 있을 때 우선적으로
      cover.setCoverImg(Constants.TMDB_IMG_PREFIX_ORIGIN + "/" + tmdbMovie.getBackdropPath());
    }
    
    return cover;
  }

  
  
  
}
