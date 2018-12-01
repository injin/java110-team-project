package bitcamp.java110.cms.domain;

import java.sql.Date;

public class PostCmt {

  protected int pstno;
  protected int pcno;
  protected int mno;
  protected Date createdDate;
  protected Date modifiedDate;
  protected String content;
  protected Member member;
  
  
  public int getPstno() {
    return pstno;
  }
  public void setPstno(int pstno) {
    this.pstno = pstno;
  }
  public Member getMember() {
    return member;
  }
  public void setMember(Member member) {
    this.member = member;
  }
 
  public int getPcno() {
    return pcno;
  }
  public void setPcno(int pcno) {
    this.pcno = pcno;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
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
  @Override
  public String toString() {
    return "PostCmt [pstno=" + pstno + ", pcno=" + pcno + ", mno=" + mno + ", createdDate="
        + createdDate + ", modifiedDate=" + modifiedDate + ", content=" + content + ", member="
        + member + "]";
  }
}
