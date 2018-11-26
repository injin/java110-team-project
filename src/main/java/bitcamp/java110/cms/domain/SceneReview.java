package bitcamp.java110.cms.domain;

import bitcamp.java110.cms.common.Constants;
import info.movito.themoviedbapi.model.MovieDb;

public class SceneReview {
  
  protected Integer srno;
  protected Integer mvno;
  protected Integer mno;
  protected String title;
  protected String time;
  protected String photo;
  protected String cont;
  protected String spo;
  protected MovieDb movieDb;
  protected Movie movie; // mv_mv 테이블 등록용
  protected boolean trgtSrExist;
  
  public Integer getSrno() {
    return srno;
  }
  public void setSrno(Integer srno) {
    this.srno = srno;
  }
  public Integer getMvno() {
    return mvno;
  }
  public void setMvno(Integer mvno) {
    this.mvno = mvno;
  }
  public Integer getMno() {
    return mno;
  }
  public void setMno(Integer mno) {
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
  public Movie getMovie() {
    return movie;
  }
  public void setMovie(Movie movie) {
    this.movie = movie;
  }
  public String getImgPath() {
    if (photo == null) {
      if (movieDb.getBackdropPath() != null) {
        return Constants.TMDB_IMG_PREFIX_ORIGIN + movieDb.getBackdropPath();
      } else {
        return "/img/default-movie-cover-img.jpg";
      }
      
    } else {
      return "/upload/sceneReview/" + photo;
    }
  }
  public boolean isTrgtSrExist() {
    return trgtSrExist;
  }
  public void setTrgtSrExist(boolean trgtSrExist) {
    this.trgtSrExist = trgtSrExist;
  }
  
  @Override
  public String toString() {
    return "SceneReview [srno=" + srno + ", mvno=" + mvno + ", mno=" + mno + ", title=" + title
        + ", time=" + time + ", photo=" + photo + ", cont=" + cont + ", spo=" + spo + ", movieDb="
        + movieDb + ", movie=" + movie + ", trgtSrExist=" + trgtSrExist + "]";
  }
}
