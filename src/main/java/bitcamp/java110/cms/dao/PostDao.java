package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Post;

public interface PostDao {

  int insert(Post post);
  List<Post> findAll(int mno);
  List<Post> findSome(Map<String, Object> params);
  List<Post> getFeedListFirst(int mno);
  List<Post> getFeedListSome(Map<String, Object> params);
  Post findOne(int pstno);
  
  int delete(int no);
  List<Post> findByKeyword(Map<String, Object> params);
  List<Post> listTopMp();
  void signOut(int mno);
  List<Post> getMyPostList(int mno);
  List<Post> getOthersPostList(int tgtMno);
  Boolean deleteUnlockPost(int pstno);
  Boolean deleteLockPost(int pstno);
  Boolean deletePost(int pstno);
  void updatePost(Post post);
}