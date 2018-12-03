package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.java110.cms.dao.LikeDao;
import bitcamp.java110.cms.domain.Like;
import bitcamp.java110.cms.service.LikeService;

@Service
public class LikeServiceImpl implements LikeService {
  
  @Autowired LikeDao likeDao;
  
  private Like makeLike(int pstno, String type, int mno) {
    
    Like like = new Like();
    like.setPstno(pstno);
    like.setType(type);
    like.setMno(mno);
    return like;
  }

  @Override
  public boolean checkLike(int pstno, String type, int mno) {
    
    Like targetLike = makeLike(pstno, type, mno);
    if (likeDao.findOne(targetLike) == null) {
      return false;
    } else {
      return true;
    }
  }

  @Override
  public boolean addLike(int pstno, String type, int mno) {
    Like targetLike = makeLike(pstno, type, mno);
    if (likeDao.add(targetLike) > 0)
      return true;
    else
      return false;
  }

  @Override
  public boolean cancelLike(int pstno, String type, int mno) {
    Like targetLike = makeLike(pstno, type, mno);
    if (likeDao.delete(targetLike) > 0)
      return true;
    else
      return false;
  }
  
  @Override
  public List<Like> listLike(int pstno, String type){

    HashMap<String, Object> lparams = new HashMap<>();
    lparams.put("pstno", pstno);
    lparams.put("type", type);

    return likeDao.findAll(lparams);
  }
}
