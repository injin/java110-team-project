package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.dao.SceneAlbumDao;
import bitcamp.java110.cms.domain.SceneAlbum;
import bitcamp.java110.cms.service.SceneAlbumService;
import bitcamp.java110.cms.web.myFeed.Paging;

@Service
public class SceneAlbumServiceImpl implements SceneAlbumService {

  @Autowired SceneAlbumDao sceneAlbumDao;
  /*@Autowired MovieDao movieDao;*/

  @Transactional(
      propagation=Propagation.REQUIRED,
      rollbackFor=Exception.class)
  @Override
  public void add(int mno, SceneAlbum sceneAlbum) {

 /*     HashMap<String, Object> params = new HashMap<>();
      params.put("lbmTitle", sceneAlbum.getLbmTitle());
      params.put("open", sceneAlbum.isOpen());
      ieDao.insert(params);
*/
    Map<String, Object> condition = new HashMap<>();
    condition.put("mno", mno);
    condition.put("sceneAlbum", sceneAlbum);
    sceneAlbumDao.insert(condition);
/*
    List<String> plst = sceneAlbum.getPhotos();
    for(int i=0;i<plst.size();i++)
    {
      HashMap<String, Object> params = new HashMap<>();
      params.put("phot", plst.get(i));
      params.put("pstno", sceneAlbum.getPstno());

      postPhotoDao.insert(params);
    }*/

  }
  @Override
  public List<SceneAlbum> srList(int mno, SceneAlbum sceneAlbum) {
    Map<String, Object> condition = new HashMap<>();
    condition.put("mno", mno);
    condition.put("sceneAlbum", sceneAlbum);
    return sceneAlbumDao.srAlbumList(condition);
  }
  
  @Override
  public List<SceneAlbum> list(int mno) {
    return sceneAlbumDao.findAll(mno);
  }
  
  @Override
  public List<SceneAlbum> list2(int mno, int srno) {
    Map<String, Object> condition = new HashMap<>();
    condition.put("mno", mno);
    condition.put("srno", srno);
    return sceneAlbumDao.findAll2(condition);
  }
  
  @Override
  public List<SceneAlbum> pageList(int mno, Paging paging) {
    
    Map<String, Object> condition = new HashMap<>();
    condition.put("mno", mno);
    condition.put("paging", paging);
    return sceneAlbumDao.findByPageNo(condition);
  }

  @Override
  public int getTotalCnt(int mno) {
    return sceneAlbumDao.getTotalCnt(mno);
  }
  
  @Override
  public boolean addImg(int lbmno, String phot) {
    Map<String, Object> condition = new HashMap<>();
    condition.put("lbmno", lbmno);
    condition.put("phot", phot);
    if (sceneAlbumDao.addImg(condition) > 0) {
      return true;
    } else {
      return false;
    }
  }
  
  @Override
  public SceneAlbum get(int no) {
    return null;
  }

  @Transactional
  @Override
  public void delete(int no) {

  }
  @Override
  public List<SceneAlbum> listScA() {
    // TODO Auto-generated method stub
    return sceneAlbumDao.listScA();
  }
  
}