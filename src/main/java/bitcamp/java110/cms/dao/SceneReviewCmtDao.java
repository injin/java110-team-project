package bitcamp.java110.cms.dao;

import bitcamp.java110.cms.domain.SceneReviewCmt;

public interface SceneReviewCmtDao {
  int insert(SceneReviewCmt comment);
  void signOut1(int mno);
}
