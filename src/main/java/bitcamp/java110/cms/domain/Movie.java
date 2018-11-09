package bitcamp.java110.cms.domain;

public class Movie {

  protected int mvno;
  protected int mvid;
  protected int title;
  public int getMvno() {
    return mvno;
  }
  public void setMvno(int mvno) {
    this.mvno = mvno;
  }
  public int getMvid() {
    return mvid;
  }
  public void setMvid(int mvid) {
    this.mvid = mvid;
  }
  public int getTitle() {
    return title;
  }
  public void setTitle(int title) {
    this.title = title;
  }
  public Movie(int mvno, int mvid, int title) {
    super();
    this.mvno = mvno;
    this.mvid = mvid;
    this.title = title;
  }
}

