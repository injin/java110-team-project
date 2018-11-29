package bitcamp.java110.cms.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Post implements Serializable {

  private static final long serialVersionUID = 1L;
  
  protected int pstno;
  protected int mno;
  protected int pstTypeNo;
  protected int mvno;
  protected String title;
  protected Date createdDate;
  protected Date modifiedDate;
  protected String content;
  protected int likeCnt;
  protected int star;
  protected boolean open;
  

  protected Member member;
  protected List<String> photos;
  protected List<String> htags;
  protected List<Member> ftags;
  protected String ftagsForAdd;
  
  
  
  
  public String getFtagsForAdd() {
    return ftagsForAdd;
  }
  public void setFtagsForAdd(String ftagsForAdd) {
    this.ftagsForAdd = ftagsForAdd;
  }
  public List<Member> getFtags() {
    return ftags;
  }
  public void setFtags(List<Member> ftags) {
    this.ftags = ftags;
  }
  public Member getMember() {
    return member;
  }
  public void setMember(Member member) {
    this.member = member;
  }
  public int getPstno() {
    return pstno;
  }
  public void setPstno(int pstno) {
    this.pstno = pstno;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public int getPstTypeNo() {
    return pstTypeNo;
  }
  public void setPstTypeNo(int pstTypeNo) {
    this.pstTypeNo = pstTypeNo;
  }
  public int getMvno() {
    return mvno;
  }
  public void setMvno(int mvno) {
    this.mvno = mvno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
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
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content.replaceAll("(\r\n|\n)", "<br>");
  }
  public int getLikeCnt() {
    return likeCnt;
  }
  public void setLikeCnt(int likeCnt) {
    this.likeCnt = likeCnt;
  }
  public int getStar() {
    return star;
  }
  public void setStar(int star) {
    this.star = star;
  }
  public boolean isOpen() {
    return open;
  }
  public void setOpen(boolean open) {
    this.open = open;
  }
  public List<String> getPhotos() {
    return photos;
  }
  public void setPhotos(List<String> photos) {
    this.photos = photos;
  }
  public List<String> getHtags() {
    return htags;
  }
  public void setHtags(List<String> htags) {
    this.htags = htags;
  }
  @Override
  public String toString() {
    return "\n[pstno=" + pstno + ", mno=" + mno + ", pstTypeNo=" + pstTypeNo + ", mvno=" + mvno
        + ", title=" + title + ", createdDate=" + createdDate + ", modifiedDate=" + modifiedDate
        + ", content=" + content + ", likeCnt=" + likeCnt + ", star=" + star + ", open=" + open
        + ", member=" + member + ", photos=" + photos + ", htags=" + htags + ", ftags=" + ftags
        + ", ftagsForAdd=" + ftagsForAdd + "]";
  }
  
}
