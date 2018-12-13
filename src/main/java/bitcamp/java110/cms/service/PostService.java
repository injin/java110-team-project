package bitcamp.java110.cms.service;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.domain.PostCmt;

public interface PostService {
  
    /* 포스트 */
    List<Post> getPosts(Map<String, Object> params);
    List<Post> getHotPosts();
    Post getOnePost(int pstno);
    void addPost (Post post);
    Boolean deletePost(int pstno);
    void updatePost(Post post);
    Boolean signOut(int mno);
    
    /* 댓글 */
    List<PostCmt> getCmts(int no);
    void addCmt(PostCmt postCmt);
    void deleteCmt(int pcno);
    void updateCmt(PostCmt postCmt);
    
    /* 영화정보 */
    void setMovieInfo(List<Post> list);
}

