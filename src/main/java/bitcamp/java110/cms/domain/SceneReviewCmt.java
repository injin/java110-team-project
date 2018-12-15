package bitcamp.java110.cms.domain;

import java.util.Date;
import bitcamp.java110.cms.common.CharacterConverter;

public class SceneReviewCmt {
  
  protected int cmno;           // 댓글번호
  protected int mvno;           // 영화 id
  protected int srno;           // 장면번호
  protected int mno;            // 회원번호
  protected String title;       // 영화 제목 여기고쳐
  protected String photo;       // 사진
  protected String cont;        // 내용
  protected Date createdDate;   // 생성일시
  protected Date modifiedDate;  // 수정일시
  protected SceneReviewMap map; // 지도
  protected String mvnm;        // 영화이름
  protected Member member;      // 작성자
  
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public int getMvno() {
    return mvno;
  }
  public void setMvno(int mvno) {
    this.mvno = mvno;
  }
  public int getCmno() {
    return cmno;
  }
  public void setCmno(int cmno) {
    this.cmno = cmno;
  }
  public int getSrno() {
    return srno;
  }
  public void setSrno(int srno) {
    this.srno = srno;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public String getPhoto() {
    return photo;
  }
  public void setPhoto(String photo) {
    this.photo = photo;
  }
  public String getCont() {
    return cont;
  }
  public void setCont(String cont) {
    this.cont = CharacterConverter.convert(cont);
  }
  public Date getCreatedDate() {
    return createdDate;
  }
  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }
  public Date getModifiedDate() {
    return modifiedDate;
  }
  public void setModifiedDate(Date modifiedDate) {
    this.modifiedDate = modifiedDate;
  }
  public SceneReviewMap getMap() {
    return map;
  }
  public void setMap(SceneReviewMap map) {
    this.map = map;
  }
  public String getMvnm() {
    return mvnm;
  }
  public void setMvnm(String mvnm) {
    this.mvnm = mvnm;
  }
  public Member getMember() {
    return member;
  }
  public void setMember(Member member) {
    this.member = member;
  }
  @Override
  public String toString() {
    return "SceneReviewCmt [cmno=" + cmno + ", mvno=" + mvno + ", srno=" + srno + ", mno=" + mno
        + ", title=" + title + ", photo=" + photo + ", cont=" + cont + ", createdDate="
        + createdDate + ", modifiedDate=" + modifiedDate + ", map=" + map + ", mvnm=" + mvnm
        + ", member=" + member + "]";
  }
  
}
