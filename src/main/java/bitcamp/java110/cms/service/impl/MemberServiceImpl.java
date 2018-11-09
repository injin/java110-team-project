package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.dao.FavGenreDao;
import bitcamp.java110.cms.dao.MemberDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
  
  @Autowired MemberDao memberDao;
  @Autowired FavGenreDao favGenreDao;
  
  @Transactional(propagation=Propagation.REQUIRED,
                  rollbackFor=Exception.class)
  @Override
  public void add (Member member) {
    memberDao.insert(member);
    
    List <Integer> favGenre = member.getFavGenres();
    
    for (int i = 0; i < favGenre.size(); i++) {
      HashMap<Integer, Integer> params = new HashMap<>();
      params.put(member.getMno(), favGenre.get(i));
      
      favGenreDao.insert(params);
    }
  }

  @Override
  public Member findById (String id) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public void update(Member member) {
    // TODO Auto-generated method stub
    
  }
}
