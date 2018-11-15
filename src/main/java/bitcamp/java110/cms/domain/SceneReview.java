package bitcamp.java110.cms.domain;

public class SceneReview {
  
  protected int mno;
  protected int time;
  protected String title;
  protected String cont;
  protected String spo;
  protected String photo;
  protected String coverImg;
  protected Movie movie;
  
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public int getTime() {
    return time;
  }
  public void setTime(int time) {
    this.time = time;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getCont() {
    return cont;
  }
  public void setCont(String cont) {
    this.cont = cont;
  }
  public String getSpo() {
    return spo;
  }
  public void setSpo(String spo) {
    this.spo = spo;
  }
  public String getCoverImg() {
    return coverImg;
  }
  public String getPhoto() {
    return photo;
  }
  public void setPhoto(String photo) {
    this.photo = photo;
  }
  public void setCoverImg(String coverImg) {
    this.coverImg = coverImg;
  }
  public Movie getMovie() {
    return movie;
  }
  public void setMovie(Movie movie) {
    this.movie = movie;
  }
  
  @Override
  public String toString() {
    return "SceneReview [mno=" + mno + ", time=" + time + ", title=" + title + ", cont=" + cont
        + ", spo=" + spo + ", photo=" + photo + ", coverImg=" + coverImg + ", movie=" + movie + "]";
  }
}
