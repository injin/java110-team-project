package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
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
    

  }

  @Override
  public Member findById (String id) {
    // TODO Auto-generated method stub
    return null;
  }
  
  @Transactional(propagation=Propagation.REQUIRED,
                 rollbackFor=Exception.class)
  @Override
  public void update(Member member) {
    System.out.println(member);
    System.out.println("update M?");
    memberDao.update(member);
    System.out.println("update M!");
    
    if (member.getFavGenres().size() > 0) {
      System.out.println("if 진입");
      for (int i = 0; i < member.getFavGenres().size(); i++) {
        
        HashMap<Integer, Object> params = new HashMap<>();
        params.put(member.getMno(), member.getFavGenres().get(i));
        System.out.print(member.getMno() + " : ");
        System.out.println(member.getFavGenres().get(i));
        favGenreDao.insert(params);
        System.out.println("쇽");
      }
    }
    System.out.println("들어감?");
  }
}
