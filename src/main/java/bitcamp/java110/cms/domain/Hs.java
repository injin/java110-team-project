package bitcamp.java110.cms.domain;

public class Hs {
  
  int no;
  protected String name;
  protected String type;
  protected String cont;
  protected String phot;
 
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getType() {
    return type;
  }
  public void setType(String type) {
    this.type = type;
  }
  public String getCont() {
    return cont;
  }
  public void setCont(String cont) {
    this.cont = cont;
  }
  public String getPhot() {
    return phot;
  }
  public void setPhot(String phot) {
    this.phot = phot;
  }
  @Override
  public String toString() {
    return "Hs [no=" + no + ", name=" + name + ", type=" + type + ", cont=" + cont + ", phot="
        + phot + "]";
  }
   
  

}
