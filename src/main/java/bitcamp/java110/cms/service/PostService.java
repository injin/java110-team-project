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
    
    /* JEAHA 작업영역 */
    List<Post> getMyPostList(int mno);
//    Post updatePost(int pstno);
    void deletePost(int pstno);
    /* JEAHA 작업영역 */
}

