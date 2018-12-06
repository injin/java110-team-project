package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.common.Paging;
import bitcamp.java110.cms.domain.SceneAlbum;

public interface SceneAlbumService {
  
    void add (int mno, SceneAlbum sceneAlbum);
    List<SceneAlbum> srList(int mno, SceneAlbum sceneAlbum);
    List<SceneAlbum> list(int mno);
    List<SceneAlbum> list2(int mno, int srno);
    List<SceneAlbum> pageList(int mno, Paging paging, boolean isMyAlbum);
    List<SceneAlbum> listScA();
    int getTotalCnt(int mno, boolean isMyAlbum);
    boolean addImg(int lbmno, String phot);
    boolean removeImg(int lbmno, int srno);
    boolean removeLbm(int lbmno);
    boolean editLbm(int lbmno, String lbmTitle);
    boolean editOpen(SceneAlbum sceneAlbum);
    SceneAlbum get(int lbmno);
    void delete(int no);
    
}

