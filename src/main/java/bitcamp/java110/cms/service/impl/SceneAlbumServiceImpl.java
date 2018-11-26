package bitcamp.java110.cms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.dao.SceneAlbumDao;
import bitcamp.java110.cms.domain.SceneAlbum;
import bitcamp.java110.cms.service.SceneAlbumService;

@Service
public class SceneAlbumServiceImpl implements SceneAlbumService {

  @Autowired SceneAlbumDao sceneAlbumDao;
  /*@Autowired MovieDao movieDao;*/

  @Transactional(
      // 트랜잭션 관리자의 이름이 transactionPost 라면
      // 다음 속성은 생략해도 된다.
      //transactionPost="transactionPost",

      // 이 메서드를 호출하는 쪽에 이미 트랜잭션이 있으면 그 트랜잭션에 소속되게 하고,
      // 없으면 새 트랜잭션을 만들어서 수행한다.
      // 기본 값은 propagation=Propagation.REQUIRED 이다.
      propagation=Propagation.REQUIRED,

      // 메서드를 실행 중에 Exception 예외가 발생하면 rollback을 수행한다.
      rollbackFor=Exception.class
      )
  @Override
  public void add(SceneAlbum sceneAlbum) {

 /*     HashMap<String, Object> params = new HashMap<>();
      params.put("lbmTitle", sceneAlbum.getLbmTitle());
      params.put("open", sceneAlbum.isOpen());
      ieDao.insert(params);
*/
    sceneAlbumDao.insert(sceneAlbum);
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
  public List<SceneAlbum> list() {
    
    List<SceneAlbum> lists = sceneAlbumDao.findAll();
    
    return lists;
  }
  
  @Override
  public List<SceneAlbum> pageList(int pageNo) {
    
    List<SceneAlbum> lists = sceneAlbumDao.findByPageNo(pageNo);
    
    return lists;
  }

  @Override
  public SceneAlbum get(int no) {
    return null;
  }

  @Transactional
  @Override
  public void delete(int no) {

  }
}