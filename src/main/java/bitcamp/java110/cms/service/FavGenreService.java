package bitcamp.java110.cms.service;

import java.util.Map;

/**
 * @author jeahasorrowkissed
 *  회원 가입시 혹은 회원 정보 수정시
 *  회원 선호 장르 테이블에 정보를 넣음
 */
public interface FavGenreService {
//  List<Genre> getList();
  void insert (Map<String, Object> params);
}
