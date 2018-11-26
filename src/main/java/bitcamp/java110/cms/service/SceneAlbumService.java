package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.domain.SceneAlbum;

public interface SceneAlbumService {
  
    void add (SceneAlbum sceneAlbum);
    List<SceneAlbum> list();
    List<SceneAlbum> pageList(int pageNo);
    int getTotalCnt(int mno);
    SceneAlbum get(int no);
    void delete(int no);
    
}

