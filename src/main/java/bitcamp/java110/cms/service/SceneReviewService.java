package bitcamp.java110.cms.service;

import bitcamp.java110.cms.domain.SceneCover;
import info.movito.themoviedbapi.model.MovieDb;

public interface SceneReviewService {
  
  public SceneCover makeSceneCover(MovieDb tmdbMovie);
  
}
