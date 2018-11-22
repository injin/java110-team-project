package bitcamp.java110.cms.dao;

import java.util.List;
import bitcamp.java110.cms.domain.SceneAlbum;

public interface SceneAlbumDao {

  int insert(SceneAlbum sceneAlbum);
  List<SceneAlbum> findAll();
  SceneAlbum findByNo(int no);
  int delete(int no);
  void signOut(int mno);
}
