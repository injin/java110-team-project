package bitcamp.java110.cms.domain;

import java.sql.Date;

public class SceneAlbum {

  protected int lbmno;
  protected int mno;
  protected String lbmTitle;
  protected String phot;
  protected String p_phot;
  protected String nick;
  protected Date cdt;
  protected Date mdt;
  protected boolean include;
  protected boolean open;
  protected int srno;
  protected int srCnt;
  
  public SceneAlbum() {
    super();
  }

  public SceneAlbum(String lbmTitle, boolean open) {
    this.lbmTitle = lbmTitle;
    this.open = open;
  }

  @Override
  public String toString() {
    return "SceneAlbum [lbmno=" + lbmno + ", mno=" + mno + ", lbmTitle=" + lbmTitle + ", phot="
        + phot + ", p_phot=" + p_phot + ", nick=" + nick + ", cdt=" + cdt + ", mdt=" + mdt
        + ", include=" + include + ", open=" + open + ", srno=" + srno + ", srCnt=" + srCnt + "]";
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
  public String getP_phot() {
    return p_phot;
  }
  public void setP_phot(String p_phot) {
    this.p_phot = p_phot;
  }
  public String getNick() {
    return nick;
  }
  public void setNick(String nick) {
    this.nick = nick;
  }
  public Date getCdt() {
    return cdt;
  }
  public void setCdt(Date cdt) {
    this.cdt = cdt;
  }
  public Date getMdt() {
    return mdt;
  }
  public void setMdt(Date mdt) {
    this.mdt = mdt;
  }
  public boolean isInclude() {
    return include;
  }
  public void setInclude(boolean include) {
    this.include = include;
  }
  public boolean isOpen() {
    return open;
  }
  public void setOpen(boolean open) {
    this.open = open;
  }
  public int getSrno() {
    return srno;
  }
  public void setSrno(int srno) {
    this.srno = srno;
  }
  public int getSrCnt() {
    return srCnt;
  }
  public void setSrCnt(int srCnt) {
    this.srCnt = srCnt;
  }
  public String getProfileImagePath() {
    if (p_phot == null) {
      return "/img/default-profile-img";
    }
    if (p_phot.startsWith("http")) {
      return p_phot;
    } else {
      return "/upload/profile/" + p_phot;
    }
  }
  
  
  
  
}