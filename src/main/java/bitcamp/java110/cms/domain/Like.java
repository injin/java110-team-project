package bitcamp.java110.cms.domain;

public class Like {
  
  protected int pstno;
  protected String type;
  protected int mno;
  
  public int getPstno() {
    return pstno;
  }
  public void setPstno(int pstno) {
    this.pstno = pstno;
  }
  public String getType() {
    return type;
  }
  public void setType(String type) {
    this.type = type;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  
  @Override
  public String toString() {
    return "Like [pstno=" + pstno + ", type=" + type + ", mno=" + mno + "]";
  }
}
