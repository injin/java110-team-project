package bitcamp.java110.cms.domain;

public class Theme {
  
  protected int thmno;
  protected String thm;
  
  @Override
  public String toString() {
    return "Theme [thmno=" + thmno + ", thm=" + thm + "]";
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
  
}
