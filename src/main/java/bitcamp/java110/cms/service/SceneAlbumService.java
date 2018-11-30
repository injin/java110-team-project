package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.domain.SceneAlbum;
import bitcamp.java110.cms.web.myFeed.Paging;

public interface SceneAlbumService {
  
    void add (int mno, SceneAlbum sceneAlbum);
    List<SceneAlbum> srList(int mno, SceneAlbum sceneAlbum);
    List<SceneAlbum> list(int mno);
    List<SceneAlbum> list2(int mno, int srno);
    List<SceneAlbum> pageList(int mno, Paging paging);
    int getTotalCnt(int mno);
    boolean addImg(int lbmno, String phot);
    boolean removeImg(int lbmno, int srno);
    SceneAlbum get(int no);
    void delete(int no);
    
}

