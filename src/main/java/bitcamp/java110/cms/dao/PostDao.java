package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Post;

public interface PostDao {

  int insert(Post post);
  List<Post> findAll(Map<String, Object> params);
  Post findByNo(int no);
  int delete(int no);
}
