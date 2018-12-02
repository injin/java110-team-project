package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.dao.FlwDao;
import bitcamp.java110.cms.dao.LikeDao;
import bitcamp.java110.cms.dao.MovieAnlyDao;
import bitcamp.java110.cms.dao.MovieDao;
import bitcamp.java110.cms.dao.PostCmtDao;
import bitcamp.java110.cms.dao.PostDao;
import bitcamp.java110.cms.dao.PostPhotoDao;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.domain.PostCmt;
import bitcamp.java110.cms.service.PostService;

@Service
public class PostServiceImpl implements PostService {

  @Autowired PostPhotoDao postPhotoDao;
  @Autowired PostDao postDao;
  @Autowired MovieDao movieDao;
  @Autowired FlwDao flwDao;
  @Autowired PostCmtDao postCmtDao;
  @Autowired MovieAnlyDao movieAnlyDao;
  @Autowired LikeDao likeDao;
  
  /* 포스트 */

  @Override
  public List<Post> getPosts(Map<String, Object> params) {

    List<Post> posts = null;
    if((params.get("prevpstno")).equals("x")) {
      posts =postDao.findAll((int)(params.get("mno")));
    }else if((params.get("prevpstno")).equals("only")){
      posts = postDao.getMyPostList((int)(params.get("mno")));
    }else {
      posts =postDao.findSome(params);
    }

    for(int i=0;i<posts.size();i++)
    {
      System.out.println(posts.get(i).isLikeCheck());
      posts.get(i).setPhotos(postPhotoDao.findByNo(posts.get(i).getPstno()));
      posts.get(i).setFtags(flwDao.listForPost(posts.get(i).getPstno()));
      
      HashMap<String, Object> lparams = new HashMap<>();
      lparams.put("pstno", posts.get(i).getPstno());
      lparams.put("type", (posts.get(i).getPstTypeNo()==0)?"mp":"dp");

      posts.get(i).setLikeCnt(likeDao.findAll(lparams).size());
    }
    return posts;
  }

  @Override
  public Post getOnePost(int no) {
    return postDao.findByNo(no);
  }

  @Override
  public List<Post> keywordPosts(String keyword) {

    List<Post> hashposts = postDao.findByKeyword(keyword);
    for(int i=0;i<hashposts.size();i++)
    {
      hashposts.get(i).setPhotos(postPhotoDao.findByNo(hashposts.get(i).getPstno()));
    }
    return hashposts;
  }

  @Override
  public List<Post> getHotPosts() {

    List<Post> posts = postDao.listTopMp();
    for(int i=0;i<posts.size();i++)
    {
      posts.get(i).setPhotos(postPhotoDao.findByNo(posts.get(i).getPstno()));
    }
    return posts;
  }

  @Transactional(rollbackFor=Exception.class)
  @Override
  public void addPost(Post post) {

    postDao.insert(post);

    List<String> plst = post.getPhotos();
    String resultFtags = post.getFtagsForAdd();
    if(resultFtags != null && !resultFtags.trim().equals("")) {
      String[] flst = resultFtags.split(",");
      for(int i=0;i<flst.length;i++)
      {
        HashMap<String, Object> params = new HashMap<>();
        params.put("pstno", post.getPstno());
        params.put("flwno", flst[i]);
        flwDao.insertForPost(params);
      }
    }

    for(int i=0;i<plst.size();i++){
      HashMap<String, Object> params = new HashMap<>();
      params.put("phot", plst.get(i));
      params.put("pstno", post.getPstno());
      postPhotoDao.insert(params);
    }


    if(post.getMvno() !=0 &&  movieDao.findByNo(post.getMvno()) == null) {
      HashMap<String, Object> params = new HashMap<>();
      params.put("mvno", post.getMvno());
      params.put("titl", post.getTitle());
      movieDao.insert(params);
    }

    if(post.getPstTypeNo() == 0) {
      HashMap<String, Object> mparams = new HashMap<>();
      mparams.put("mno", post.getMno());
      mparams.put("mvno", post.getMvno());
      mparams.put("pnt", (post.getStar()<2)?5:(5+post.getStar()));

      if(movieAnlyDao.findOne(mparams)>0) {
        movieAnlyDao.update(mparams);
      }else { 
        movieAnlyDao.insertPost(mparams);    
      }
    }
  }

  @Override
  public Boolean deletePost(int pstno) {
    String type = postDao.getPostType(pstno);
    if(type.equals("u")) {
      if(postDao.countCmt(pstno) == 0) {
        postDao.deletePost(pstno);
        return postDao.deletePost(pstno);
      }
      return postDao.deleteUnlockPost(pstno);
    } else if(type.equals("l")) {
      postDao.deleteLockPost(pstno);
      return postDao.deleteLockPost(pstno);
    }
    return false;
  }

  @Override
  public String updatePost(Post post) {
    // TODO Auto-generated method stub
    //  ADD(Post post)와 같은 방식??
    return null;
  }

  /* 댓글 */

  @Override
  public List<PostCmt> getCmts(int no) {
    return postCmtDao.findCmtList(no);
  }

  @Override
  public void addCmt(PostCmt postCmt) {
    postCmtDao.insertCmt(postCmt);
  }

  @Override
  public void deleteCmt(int pcno) {
    postCmtDao.deleteCmt(pcno);
  }

  @Override
  public void updateCmt(PostCmt postCmt) {
    postCmtDao.updateCmt(postCmt);
  }
}