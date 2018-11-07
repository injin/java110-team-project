package bitcamp.java110.cms.domain;

import java.io.Serializable;

public class Genre implements Serializable {
  private static final long serialVersionUID = 1L;
  
  protected int grno;
  protected String grName;
  
  public int getGrno() {
    return grno;
  }
  public void setGrno(int grno) {
    this.grno = grno;
  }
  public String getGrName() {
    return grName;
  }
  public void setGrName(String grName) {
    this.grName = grName;
  }

}
