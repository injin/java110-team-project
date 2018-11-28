package bitcamp.java110.cms.service;

public interface LikeService {
  
  boolean checkLike(int pstno, String type, int mno);
  boolean addLike(int pstno, String type, int mno);
  boolean cancelLike(int pstno, String type, int mno);
}
