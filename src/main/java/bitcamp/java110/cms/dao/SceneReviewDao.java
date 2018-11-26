package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.domain.SceneReviewCmt;
import bitcamp.java110.cms.domain.SceneReviewMap;

public interface SceneReviewDao {
  
  int insert(SceneReview sceneReview);
  int insertCmt(SceneReviewCmt sceneReviewCmt);
  int insertCmtMap(SceneReviewMap sceneReviewMap);
  String findDefaultTime(int mvno);
  SceneReview findByTime(Map<String, Object> condition);
  SceneReview findByNo(int srno);
  List<SceneReview> list(int mvno);
  List<SceneReviewCmt> listCmt(int srno);
  void signOut(int mno);
}
