package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.dao.PostDao;
import bitcamp.java110.cms.dao.PostHashtagDao;
import bitcamp.java110.cms.dao.PostPhotoDao;
import bitcamp.java110.cms.domain.Post;
import bitcamp.java110.cms.service.PostService;

@Service
public class PostServiceImpl implements PostService {

  @Autowired PostPhotoDao postPhotoDao;
  @Autowired PostHashtagDao postHashtagDao;
  @Autowired PostDao postDao;

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
  public void add(Post post) {


    postDao.insert(post);
    List<String> plst = post.getPhotos();
    List<String> hlst = post.getHtags();
    for(int i=0;i<plst.size();i++)
    {
      HashMap<String, Object> params = new HashMap<>();
      params.put("phot", plst.get(i));
      params.put("pstno", post.getPstno());

      postPhotoDao.insert(params);
    }

    for(int i=0;i<hlst.size();i++)
    {
      HashMap<String, Object> params = new HashMap<>();
      params.put("cont", hlst.get(i));
      params.put("pstno", post.getPstno());

      postHashtagDao.insert(params);
    }
  }

  @Override
  public List<Post> list(int pageNo, int pageSize) {
    HashMap<String, Object> params = new HashMap<>();
    params.put("rowNo", (pageNo - 1)*pageSize);
    params.put("size", pageSize);
    return postDao.findAll(params);
  }

  @Override
  public List<Post> getHash(String keyword) {
    
    return postHashtagDao.get(keyword);
  }
  
  @Override
  public Post get(int no) {
    return postDao.findByNo(no);
  }

  @Transactional
  @Override
  public void delete(int no) {

    if (postDao.delete(no) == 0) {
      throw new RuntimeException("해당 번호의 데이터가 없습니다.");
    }
    postPhotoDao.delete(no);
  }

}
