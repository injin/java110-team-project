package bitcamp.java110.cms.service;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.domain.PostCmt;

public interface PostService {
  
    void add (Post post);
    List<Post> list(Map<String, Object> params);
    Post get(int no);
    List<Post> findByKeyword(String keyword);
    List<Post> listTopMp();
    List<PostCmt> findCmts(int no);
    void addCmt(PostCmt postCmt);
    void delete(int no);
    void deleteCmt(int pcno);
    void updateCmt(PostCmt postCmt);
    /* JEAHA 작업영역 */
    List<Post> getMyPostList(int mno);
    Boolean deletePost(int pstno);
    String updatePost(Post post);
    /* JEAHA 작업영역 */
}

