package bitcamp.java110.cms.domain;

import java.sql.Date;

public class SceneAlbum {

  protected int lbmno;
  protected int mno;
  protected String lbmTitle;
  protected String phot;
  protected Date cdt;
  protected Date md;
  protected boolean open;
  
  @Override
  public String toString() {
    return "SceneAlbum [lbmno=" + lbmno + ", mno=" + mno + ", lbmTitle=" + lbmTitle + ", phot="
        + phot + ", cdt=" + cdt + ", md=" + md + ", open=" + open + "]";
  }
  
  public int getLbmno() {
    return lbmno;
  }
  public void setLbmno(int lbmno) {
    this.lbmno = lbmno;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public String getLbmTitle() {
    return lbmTitle;
  }
  public void setLbmTitle(String lbmTitle) {
    this.lbmTitle = lbmTitle;
  }
  public String getPhot() {
    return phot;
  }
  public void setPhot(String phot) {
    this.phot = phot;
  }
  public Date getCdt() {
    return cdt;
  }
  public void setCdt(Date cdt) {
    this.cdt = cdt;
  }
  public Date getMd() {
    return md;
  }
  public void setMd(Date md) {
    this.md = md;
  }
  public boolean isOpen() {
    return open;
  }
  public void setOpen(boolean open) {
    this.open = open;
  }
  
  
}