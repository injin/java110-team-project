package bitcamp.java110.cms.service.impl;

import static bitcamp.java110.cms.common.Constants.LOG_DO_TYPE_DP;
import static bitcamp.java110.cms.common.Constants.LOG_DO_TYPE_MP;
import static bitcamp.java110.cms.common.Constants.LOG_DO_TYPE_PC;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.common.Constants;
import bitcamp.java110.cms.dao.FlwDao;
import bitcamp.java110.cms.dao.LikeDao;
import bitcamp.java110.cms.dao.MlogDao;
import bitcamp.java110.cms.dao.MovieAnlyDao;
import bitcamp.java110.cms.dao.MovieDao;
import bitcamp.java110.cms.dao.PostCmtDao;
import bitcamp.java110.cms.dao.PostDao;
import bitcamp.java110.cms.dao.PostPhotoDao;
import bitcamp.java110.cms.domain.Mlog;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.domain.PostCmt;
import bitcamp.java110.cms.service.PostService;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.model.Genre;
import info.movito.themoviedbapi.model.MovieDb;

@Service
public class PostServiceImpl implements PostService {

  @Autowired
  PostPhotoDao postPhotoDao;
  @Autowired
  PostDao postDao;
  @Autowired
  MovieDao movieDao;
  @Autowired
  FlwDao flwDao;
  @Autowired
  PostCmtDao postCmtDao;
  @Autowired
  MovieAnlyDao movieAnlyDao;
  @Autowired
  LikeDao likeDao;
  @Autowired
  MlogDao mlogDao;
  @Autowired 
  TmdbMovies tmdbMovies;

  /* 포스트 */

  @Override
  public List<Post> getPosts(Map<String, Object> params) {

    List<Post> posts = null;
    
    if ((params.get("prevpstno")).equals("x")) { // 처음
      if(params.get("where").equals("main")) {
        posts = postDao.findAll((int) (params.get("mno")));
      }  else if (params.get("where").equals("personal")) {
        posts = postDao.getFeedListFirst(params);
      }
    } else if ((params.get("prevpstno")).equals("forKeyword")) {
      posts = postDao.findByKeyword(params);
    } else {
      if(params.get("where").equals("main")) {
        posts = postDao.findSome(params);
      } else if (params.get("where").equals("personal")) {
        posts = postDao.getFeedListSome(params);
      }
    }
    

    for (int i = 0; i < posts.size(); i++) {
      posts.get(i).setPhotos(postPhotoDao.findByNo(posts.get(i).getPstno()));
      posts.get(i).setFtags(flwDao.listForPost(posts.get(i).getPstno()));
      posts.get(i).setCmtCnt(postCmtDao.findCmtList(posts.get(i).getPstno()).size());

      HashMap<String, Object> lparams = new HashMap<>();
      lparams.put("pstno", posts.get(i).getPstno());
      lparams.put("type", (posts.get(i).getPstTypeNo() == 0) ? "mp" : "dp");

      posts.get(i).setLikeCnt(likeDao.findAll(lparams).size());
    }
    return posts;
  }

  @Override
  public List<Post> getHotPosts() {

    List<Post> posts = postDao.listTopMp();
    for (int i = 0; i < posts.size(); i++) {
      posts.get(i).setPhotos(postPhotoDao.findByNo(posts.get(i).getPstno()));
      posts.get(i).setFtags(flwDao.listForPost(posts.get(i).getPstno()));
    }
    return posts;
  }

  @Override
  public Post getOnePost(int pstno) {

    Post post = postDao.findOne(pstno);
    post.setPhotos(postPhotoDao.findByNo(pstno));
    post.setFtags(flwDao.listForPost(pstno));

    return post;
  }


  @Transactional(rollbackFor = Exception.class)
  @Override
  public void addPost(Post post) {

    if (post.getMvno() != 0 && movieDao.findByNo(post.getMvno()) == null) {
      HashMap<String, Object> params = new HashMap<>();
      params.put("mvno", post.getMvno());
      params.put("titl", post.getTitle());
      movieDao.insert(params);
    }

    if (post.getPstTypeNo() == 0) {
      HashMap<String, Object> mparams = new HashMap<>();
      mparams.put("mno", post.getMno());
      mparams.put("mvno", post.getMvno());
      mparams.put("pnt", (post.getStar() < 2) ? 5 : (5 + post.getStar()));

      if (movieAnlyDao.findOne(mparams) > 0) {
        movieAnlyDao.update(mparams);
      } else {
        movieAnlyDao.insertPost(mparams);
      }
    }
    
    // 영화 장르 추가
    if (!movieAnlyDao.checkGrExist(post.getMvno())) {
      List<Genre> genres = tmdbMovies.getMovie(post.getMvno(), Constants.LANGUAGE_KO).getGenres();
      List<Integer> grnoList = new ArrayList<>();
      if (genres.size() > 0) {
        for(Genre g: genres) {
          grnoList.add(g.getId());
        }
      }
      HashMap<String, Object> gparams = new HashMap<>();
      gparams.put("mvno", post.getMvno());
      gparams.put("grnoList", grnoList);
      movieAnlyDao.insertGrAllNotExists(gparams);
    }
    

    postDao.insert(post);

    List<String> plst = post.getPhotos();
    String resultFtags = post.getFtagsForAdd();
    if (resultFtags != null && !resultFtags.trim().equals("")) {
      String[] flst = resultFtags.split(",");
      for (int i = 0; i < flst.length; i++) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("pstno", post.getPstno());
        params.put("flwno", flst[i]);
        flwDao.insertForPost(params);
      }
    }

    for (int i = 0; i < plst.size(); i++) {
      HashMap<String, Object> params = new HashMap<>();
      params.put("phot", plst.get(i));
      params.put("pstno", post.getPstno());
      postPhotoDao.insert(params);
    }

    Mlog mlog = new Mlog();
    mlog.setMno(post.getMno());
    mlog.setDirect((post.getPstTypeNo() == 1) ? LOG_DO_TYPE_DP : LOG_DO_TYPE_MP);
    mlog.setIndirect(post.getTitle());
    mlog.setAct("wr");
    mlog.setUrl(String.valueOf(post.getPstno()));
    mlogDao.insert(mlog);
  }
  
  @Override
  public Boolean deletePost(int pstno) {
    Post p = postDao.findOne(pstno);
    // 게시물이 공개라면.
    if (p.isOpen()) {
      // 댓글이 없다면.
      if (postCmtDao.findCmtList(pstno).size() == 0) {
        return postDao.deletePost(pstno);
      }
      // 댓글이 있다면.
      postCmtDao.deleteCmt(pstno);
      return postDao.deleteUnlockPost(pstno);
    } else if (!p.isOpen()) {
      // 게시글이 비공개라면.
      // 댓글이 없다면.
      if (postCmtDao.findCmtList(pstno).size() == 0) {
        return postDao.deleteLockPost(pstno);
      }
      // 댓글이 있다면.
      postCmtDao.deleteCmt(pstno);
      return postDao.deletePost(pstno);
      
    }
    return true;
  }
  
  @Override
  public Boolean signOut(int mno) {
      System.out.println("alPost signOut");
      
      try {
        List<Integer> alPost = postDao.getMyAllPost(mno);
        for (int pstno : alPost) {
          System.out.print(pstno + "\t");
          boolean result = deletePost(pstno);
          if(!result) {
            result = postDao.signOut(mno);
          }
          System.out.println(result);
        }
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e);
        return false;
      }
  }

  @Transactional(rollbackFor = Exception.class)
  @Override
  public void updatePost(Post post) {
    postDao.updatePost(post);
  }

  /* 댓글 */

  @Override
  public List<PostCmt> getCmts(int no) {
    return postCmtDao.findCmtList(no);
  }

  @Override
  public void addCmt(PostCmt postCmt) {
    postCmtDao.insertCmt(postCmt);
    Mlog mlog = new Mlog();
    mlog.setMno(postCmt.getMno());
    mlog.setDirect(LOG_DO_TYPE_PC);
    mlog.setIndirect("");
    mlog.setAct("wr");
    mlog.setUrl(String.valueOf(postCmt.getPstno()));
    mlogDao.insert(mlog);
  }

  @Override
  public void deleteCmt(int pcno) {
    postCmtDao.deleteCmt(pcno);
  }

  @Override
  public void updateCmt(PostCmt postCmt) {
    postCmtDao.updateCmt(postCmt);
  }

  @Override
  public void setMovieInfo(List<Post> list) {
    if (list != null) {
      for (Post post: list) {
        MovieDb tmdbMovie = tmdbMovies.getMovie(post.getMvno(), Constants.LANGUAGE_KO);
        post.setMovieDb(tmdbMovie);
      }
    }
  }
}