package bitcamp.java110.cms.domain;

public class Movie {

  protected int mvno;
  protected String title;
  
  
  public Movie(int mvno, String title) {
    super();
    this.mvno = mvno;
    this.title = title;
  }
  
  public Movie () {  }
  
  @Override
  public String toString() {
    return "[" + title + " : " + mvno + "]";
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
  
}

