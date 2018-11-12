package bitcamp.java110.cms.service.impl;

import org.springframework.stereotype.Service;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.domain.SceneCover;
import bitcamp.java110.cms.service.SceneReviewService;
import info.movito.themoviedbapi.model.MovieDb;

@Service
public class SceneReviewServiceImpl implements SceneReviewService {
  
  @Override
  public SceneCover makeSceneCover(MovieDb tmdbMovie) {
    
    SceneCover cover = new SceneCover();
    
    if (tmdbMovie.getBackdropPath() != null) { // 0분 0초 있을 때 우선적으로
      cover.setCoverImg(Constants.TMDB_IMG_PREFIX_ORIGIN + "/" + tmdbMovie.getBackdropPath());
    }
    
    return cover;
  }
  
  
}
