package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.domain.Like;

public interface LikeService {
  
  boolean checkLike(int pstno, String type, int mno);
  boolean addLike(int pstno, String type, int mno);
  boolean cancelLike(int pstno, String type, int mno);
  List<Like> listLike(int pstno, String type);
}
