package bitcamp.java110.cms.dao;

import java.util.List;
import bitcamp.java110.cms.domain.PostCmt;

public interface PostCmtDao {
  
  Integer insertCmt(PostCmt postCmt);
  List<PostCmt> findCmtList(int no);
  void signOut(int mno);
  void deleteCmt(int pcno);
  void updateCmt(PostCmt postCmt);
}
