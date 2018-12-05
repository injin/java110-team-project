package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Post;

public interface PostDao {

  int insert(Post post);
  List<Post> findAll(int mno);
  List<Post> findSome(Map<String, Object> params);
  Post findByNo(int no);
  int delete(int no);
  List<Post> findByKeyword(String keyword);
  List<Post> listTopMp();
  void signOut(int mno);
  List<Post> getMyPostList(int mno);
  List<Post> getOthersPostList(int tgtMno);
  Boolean deleteUnlockPost(int pstno);
  Boolean deleteLockPost(int pstno);
  Boolean deletePost(int pstno);
  String getPostType(int pstno);
  int countCmt(int pstno);
  void updatePost(Post post);
}