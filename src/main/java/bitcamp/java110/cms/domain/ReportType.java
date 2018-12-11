package bitcamp.java110.cms.domain;

public class ReportType {

  protected int rptno;
  protected String type;
  
  public int getMvno() {
    return rptno;
  }
  public void setMvno(int rptno) {
    this.rptno = rptno;
  }
  public String getType() {
    return type;
  }
  public void setType(String type) {
    this.type = type;
  }
  
  @Override
  public String toString() {
    return "ReportType [rptno=" + rptno + ", type=" + type + "]";
  }
  
  
}
