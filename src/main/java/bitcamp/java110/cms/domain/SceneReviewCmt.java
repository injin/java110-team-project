package bitcamp.java110.cms.domain;

import java.sql.Date;

public class SceneReviewCmt {
  
  protected int cmno;           // 댓글번호
  protected int srno;           // 장면번호
  protected int mno;            // 회원번호
  protected String photo;        // 사진
  protected String cont;        // 내용
  protected String mapName;
  protected Double lat;
  protected Double lng;
  protected Date createdDate;   // 생성일시
  protected Date modifiedDate;  // 수정일시
  
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
    this.cont = cont;
  }
  public String getMapName() {
    return mapName;
  }
  public void setMapName(String mapName) {
    this.mapName = mapName;
  }
  public Double getLat() {
    return lat;
  }
  public void setLat(Double lat) {
    this.lat = lat;
  }
  public Double getLng() {
    return lng;
  }
  public void setLng(Double lng) {
    this.lng = lng;
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
  
  @Override
  public String toString() {
    return "SceneReviewCmt [cmno=" + cmno + ", srno=" + srno + ", mno=" + mno + ", photo=" + photo
        + ", cont=" + cont + ", mapName=" + mapName + ", lat=" + lat + ", lng=" + lng
        + ", createdDate=" + createdDate + ", modifiedDate=" + modifiedDate + "]";
  }
}
