package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.dao.FavGenreDao;
import bitcamp.java110.cms.dao.MemberDao;
import bitcamp.java110.cms.dao.MovieAnlyDao;
import bitcamp.java110.cms.domain.Member;
import bitcamp.java110.cms.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
  
  @Autowired MemberDao memberDao;
  @Autowired FavGenreDao favGenreDao;
  @Autowired MovieAnlyDao movieAnlyDao;
  
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
  
  @Override
  public List<Member> findByNick(String keyword) {
    
    return memberDao.findByNick(keyword);
  }
  
  @Transactional(propagation=Propagation.REQUIRED,
                 rollbackFor=Exception.class)
  @Override
  public void update(Member member) {
    memberDao.update(member);
    
    if (member.getFavGrList() != null && member.getFavGrList().size() > 0) {
      for (int i = 0; i < member.getFavGrList().size(); i++) {
        
        HashMap<String, Object> params = new HashMap<>();
        params.put("mno", member.getMno());
        params.put("grno", member.getFavGrList().get(i));
        favGenreDao.insert(params);
      }
    }
    
    if (member.getFavMvList() != null && member.getFavMvList().size() > 0) {
      for (int i = 0; i < member.getFavMvList().size(); i++) {
        
        HashMap<String, Integer> params = new HashMap<>();
        params.put("mno", member.getMno());
        params.put("mvno", member.getFavMvList().get(i));
        movieAnlyDao.signIn(params);
      }
    }
  }
  
  /**
   * !!주석 삭제 금지!!
   * 제하 To Do
   * !! SginOut 할 때 DB에서 삭제 해야하므로 DAO완성시 추가 해야함!!
   */
  @Override
  public void signOut(int mno) {
    movieAnlyDao.signOut(mno);
    favGenreDao.signOut(mno);
    memberDao.signOut(mno);
  }
}
