package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.domain.SceneReview;
import info.movito.themoviedbapi.model.MovieDb;

public interface SceneReviewService {
  
  void add(SceneReview sceneReview);
  List<SceneReview> list(int mvno);
  SceneReview initSceneReview(MovieDb tmdbMovie, SceneReview sceneReview);
  
}
