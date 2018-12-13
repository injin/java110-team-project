package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.common.Paging;
import bitcamp.java110.cms.dao.SceneAlbumDao;
import bitcamp.java110.cms.domain.SceneAlbum;
import bitcamp.java110.cms.service.SceneAlbumService;

@Service
public class SceneAlbumServiceImpl implements SceneAlbumService {

  @Autowired SceneAlbumDao sceneAlbumDao;
  /*@Autowired MovieDao movieDao;*/

  @Transactional(
      propagation=Propagation.REQUIRED,
      rollbackFor=Exception.class)
  @Override
  public void add(int mno, SceneAlbum sceneAlbum) {

    Map<String, Object> condition = new HashMap<>();
    condition.put("mno", mno);
    condition.put("sceneAlbum", sceneAlbum);
    sceneAlbumDao.insert(condition);
  }
  
  @Override
  public List<SceneAlbum> getListByKeyword(String keyword) {
    return sceneAlbumDao.getListByKeyword(keyword);
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
  public List<SceneAlbum> pageList(int mno, Paging paging, boolean isMyAlbum) {
    
    Map<String, Object> condition = new HashMap<>();
    condition.put("mno", mno);
    condition.put("paging", paging);
    condition.put("isMyAlbum", isMyAlbum);
    return sceneAlbumDao.findByPageNo(condition);
  }

  @Override
  public int getTotalCnt(int mno, boolean isMyAlbum) {
    Map<String, Object> condition = new HashMap<>();
    condition.put("mno", mno);
    condition.put("isMyAlbum", isMyAlbum);
    return sceneAlbumDao.getTotalCnt(condition);
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
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  public boolean removeImg(int lbmno, int srno) {
    Map<String, Object> condition = new HashMap<>();
    condition.put("lbmno", lbmno);
    condition.put("srno", srno);
    
    boolean isCoverImg = sceneAlbumDao.checkImg(condition);
    if (sceneAlbumDao.removeImg(condition) > 0) {
      if (isCoverImg) {
        sceneAlbumDao.setImgNull(lbmno);
      }
      return true;
    } else {
      return false;
    }
  }
  
  @Override
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  public boolean removeLbm(int lbmno) {
    if(sceneAlbumDao.removeLbm(lbmno) > 0) {
      return true;
    }else {
      return false;
    }
  }
  
  @Override
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  public boolean editLbm(int lbmno, String lbmTitle) {
    Map<String, Object> condition = new HashMap<>();
    condition.put("lbmno", lbmno);
    condition.put("lbmTitle", lbmTitle);
    if(sceneAlbumDao.editLbm(condition) > 0) {
      return true;
    }else {
      return false;
    }
  }
  
  @Override
  @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
  public boolean editOpen(SceneAlbum sceneAlbum) {
    if(sceneAlbumDao.editOpen(sceneAlbum) > 0) {
      return true;
    }else {
      return false;
    }
  }
  
  @Override
  public SceneAlbum get(int lbmno) {
    return sceneAlbumDao.findByNo(lbmno);
  }

  @Transactional
  @Override
  public void delete(int no) {

  }
  @Override
  public List<SceneAlbum> listScA() {
    return sceneAlbumDao.listScA();
  }
  
}