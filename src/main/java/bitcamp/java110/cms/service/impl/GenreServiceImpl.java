package bitcamp.java110.cms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.java110.cms.dao.GenreDao;
import bitcamp.java110.cms.domain.Genre;
import bitcamp.java110.cms.service.GenreService;

@Service
public class GenreServiceImpl implements GenreService {
  
  @Autowired GenreDao genreDao;
  
  @Override
  public List<Genre> getList() {
    
    return genreDao.list();
  }

}
