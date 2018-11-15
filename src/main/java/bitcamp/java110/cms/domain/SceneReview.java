package bitcamp.java110.cms.domain;

import bitcamp.java110.cms.common.Constants;
import info.movito.themoviedbapi.model.MovieDb;

public class SceneReview {
  
  protected int srno;
  protected int mvno;
  protected int mno;
  protected String title;
  protected String time;
  protected String photo;
  protected String cont;
  protected String spo;
  protected MovieDb movieDb;
  
  public int getSrno() {
    return srno;
  }
  public void setSrno(int srno) {
    this.srno = srno;
  }
  public int getMvno() {
    return mvno;
  }
  public void setMvno(int mvno) {
    this.mvno = mvno;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getTime() {
    return time;
  }
  public void setTime(String time) {
    this.time = time;
  }
  public String getPhoto() {
    return photo;
  }
  public void setPhoto(String photo) {
    this.photo = photo;
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
  public MovieDb getMovieDb() {
    return movieDb;
  }
  public void setMovieDb(MovieDb movieDb) {
    this.movieDb = movieDb;
  }
  public String getImgPath() {
    if (photo == null) {
      return Constants.TMDB_IMG_PREFIX_ORIGIN + movieDb.getBackdropPath();
    } else {
      return "/upload/sceneReview/" + photo;
    }
  }
  
  @Override
  public String toString() {
    return "SceneReview [getSrno()=" + getSrno() + ", getMvno()=" + getMvno() + ", getMno()="
        + getMno() + ", getTitle()=" + getTitle() + ", getTime()=" + getTime() + ", getPhoto()="
        + getPhoto() + ", getCont()=" + getCont() + ", getSpo()=" + getSpo() + ", getMovieDb()="
        + getMovieDb() + ", getImgPath()=" + getImgPath() + "]";
  }
}
