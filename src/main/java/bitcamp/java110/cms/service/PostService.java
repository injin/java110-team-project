package bitcamp.java110.cms.service;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.domain.PostCmt;

public interface PostService {
  
    /* 포스트 */
    List<Post> getPosts(Map<String, Object> params);
    List<Post> getMyPostList(int mno);
    Post getOnePost(int pstno);
    List<Post> keywordPosts(String keyword);
    List<Post> getHotPosts();
    void addPost (Post post);
    Boolean deletePost(int pstno);
    void updatePost(Post post);
    
    /* 댓글 */
    List<PostCmt> getCmts(int no);
    void addCmt(PostCmt postCmt);
    void deleteCmt(int pcno);
    void updateCmt(PostCmt postCmt);
}

