package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.common.Paging;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.domain.SceneReviewCmt;
import info.movito.themoviedbapi.model.MovieDb;

public interface SceneReviewService {
  
  void add(SceneReview sceneReview);
  void addCmt(SceneReviewCmt sceneReviewCmt);
  SceneReview findByNo(int srno);
  List<SceneReview> list(int mvno);
  int getTotalCmtCnt(int srno);
  List<SceneReviewCmt> listCmt(int srno, Paging paging);
  List<SceneReview> listTopSr();
  void addToSrAlbum(int lbmno, int srno);
  SceneReview initSceneReview(MovieDb tmdbMovie, SceneReview sceneReview);
  
}
