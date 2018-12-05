package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import static bitcamp.java110.cms.common.Constants.LOG_DO_TYPE_MP;
import static bitcamp.java110.cms.common.Constants.LOG_DO_TYPE_DP;
import bitcamp.java110.cms.dao.FlwDao;
import bitcamp.java110.cms.dao.LikeDao;
import bitcamp.java110.cms.dao.MlogDao;
import bitcamp.java110.cms.dao.MovieAnlyDao;
import bitcamp.java110.cms.dao.MovieDao;
import bitcamp.java110.cms.dao.PostCmtDao;
import bitcamp.java110.cms.dao.PostDao;
import bitcamp.java110.cms.dao.PostPhotoDao;
<<<<<<< HEAD
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.domain.Mlog;
=======
>>>>>>> j1
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
  @Autowired MlogDao mlogDao;
  
  /* 포스트 */

  @Override
  public List<Post> getPosts(Map<String, Object> params) {

    List<Post> posts = null;
    if((params.get("prevpstno")).equals("x")) {
      posts = postDao.findAll((int)(params.get("mno")));
    }else if((params.get("prevpstno")).equals("owner")){
      posts = postDao.getMyPostList((int)(params.get("mno")));
    }else if((params.get("prevpstno")).equals("visitor")){
      posts = postDao.getOthersPostList((int)(params.get("mno")));
    } else {
      posts = postDao.findSome(params);
    }
    
    
    
    for(int i=0;i<posts.size();i++)
    {
      posts.get(i).setPhotos(postPhotoDao.findByNo(posts.get(i).getPstno()));
      posts.get(i).setFtags(flwDao.listForPost(posts.get(i).getPstno()));
      posts.get(i).setCmtCnt(postCmtDao.findCmtList(posts.get(i).getPstno()).size());
      
      HashMap<String, Object> lparams = new HashMap<>();
      lparams.put("pstno", posts.get(i).getPstno());
      lparams.put("type", (posts.get(i).getPstTypeNo()==0)?"mp":"dp");

      posts.get(i).setLikeCnt(likeDao.findAll(lparams).size());
      
    }
    return posts;
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
      posts.get(i).setFtags(flwDao.listForPost(posts.get(i).getPstno()));
    }
    return posts;
  }

  @Transactional(rollbackFor=Exception.class)
  @Override
  public void addPost(Post post) {
    
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
    
    Mlog mlog = new Mlog();
    mlog.setMno(post.getMno());
    mlog.setDirect((post.getPstTypeNo()==1)?LOG_DO_TYPE_DP:LOG_DO_TYPE_MP);
    mlog.setIndirect(post.getTitle());
    mlog.setAct("wr");
    mlog.setUrl(String.valueOf(post.getPstno()));
    mlogDao.insert(mlog);
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
  
  @Transactional(rollbackFor=Exception.class)
  @Override
  public void updatePost(Post post) {
    postDao.updatePost(post);
/*
    List<String> plst = post.getPhotos();
    for(int i=0;i<plst.size();i++){
      HashMap<String, Object> params = new HashMap<>();
      params.put("phot", plst.get(i));
      params.put("pstno", post.getPstno());
      postPhotoDao.insert(params);
    }
*/
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