package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.SceneReview;

public interface SceneReviewDao {
  
  int insert(SceneReview sceneReview);
  String findDefaultTime(int mvno);
  SceneReview findByTime(Map<String, Object> condition);
  SceneReview findByNo(int srno);
  List<SceneReview> list(int mvno);
}
