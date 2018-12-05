package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.SceneReview;
import bitcamp.java110.cms.domain.SceneReviewCmt;
import bitcamp.java110.cms.domain.SceneReviewMap;

public interface SceneReviewDao {
  
  Integer insert(SceneReview sceneReview);
  Integer insertCmt(SceneReviewCmt sceneReviewCmt);
  Integer insertCmtMap(SceneReviewMap sceneReviewMap);
  Integer findOneSrno(int mvno);
  SceneReview findByNo(int srno);
  List<SceneReview> findAll(int mvno);
  Integer getTotalCmtCnt(int srno);
  List<SceneReviewCmt> listCmt(Map<String, Object> condition);
  Integer deleteCmt(int cmno);
  Integer deleteCmtMap(int cmno);
  Integer updateCmt(SceneReviewCmt sceneReviewCmt);
  List<SceneReview> listTopSr();
  List<Member> listTopReviewer(int mvno);
  Integer addToSrAlbum(Map<String, Object> condition);
  void signOut1(int mno);
  void signOut2(int mno);
}
