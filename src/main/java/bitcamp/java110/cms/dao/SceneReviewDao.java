package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.domain.SceneReviewCmt;
import bitcamp.java110.cms.domain.SceneReviewMap;

public interface SceneReviewDao {
  
  Integer insert(SceneReview sceneReview);
  Integer insertCmt(SceneReviewCmt sceneReviewCmt);
  Integer insertCmtMap(SceneReviewMap sceneReviewMap);
  String findDefaultTime(int mvno);
  Integer findOne(int mvno);
  SceneReview findByTime(Map<String, Object> condition);
  SceneReview findByNo(int srno);
  List<SceneReview> list(int mvno);
  List<SceneReviewCmt> listCmt(int srno);
  List<SceneReview> listTopSr();
  void signOut(int mno);
}
