package bitcamp.java110.cms.dao;

import java.util.List;
import bitcamp.java110.cms.domain.Post;

public interface PostDao {

  int insert(Post post);
  List<Post> findAll();
  Post findByNo(int no);
  int delete(int no);
}
