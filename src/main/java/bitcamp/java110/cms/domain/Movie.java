package bitcamp.java110.cms.domain;

public class Movie {

  protected int mvno;
  protected int title;

  @Override
  public String toString() {
    return "Movie [mvno=" + mvno + ", title=" + title + "]";
  }
  public int getMvno() {
    return mvno;
  }
  public void setMvno(int mvno) {
    this.mvno = mvno;
  }
 
  public int getTitle() {
    return title;
  }
  public void setTitle(int title) {
    this.title = title;
  }
}

