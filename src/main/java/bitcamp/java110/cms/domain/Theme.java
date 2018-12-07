package bitcamp.java110.cms.domain;

public class Theme {
  
  protected int thmno;
  protected String thm;
  protected int mvno;
  
  @Override
  public String toString() {
    return "Theme [thmno=" + thmno + ", thm=" + thm + ", mvno=" + mvno + "]";
  }
  public int getThmno() {
    return thmno;
  }
  public void setThmno(int thmno) {
    this.thmno = thmno;
  }
  public String getThm() {
    return thm;
  }
  public void setThm(String thm) {
    this.thm = thm;
  }
  public int getMvno() {
    return mvno;
  }
  public void setMvno(int mvno) {
    this.mvno = mvno;
  }
  
}
