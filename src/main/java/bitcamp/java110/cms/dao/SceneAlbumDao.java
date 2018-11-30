package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.SceneAlbum;

public interface SceneAlbumDao {

  int insert(Map<String, Object> condition);
  List<SceneAlbum> srAlbumList(Map<String, Object> condition);
  List<SceneAlbum> findAll(int mno);
  List<SceneAlbum> findAll2(Map<String, Object> condition);
  List<SceneAlbum> findByPageNo(Map<String, Object> condition);
  int getTotalCnt(int mno);
  int addImg(Map<String, Object> condition);
  SceneAlbum findByNo(int no);
  int delete(int no);
  void signOut1(int mno);
  void signOut2(int mno);
  void signOut3(int mno);
}
