package bitcamp.java110.cms.domain;

import java.io.Serializable;
import java.util.List;


public class Member implements Serializable {
  
  private static final long serialVersionUID = 1L;
  
  protected int mno;
  protected boolean admin;
  protected String id;
  protected String nickname;
  protected String profileImage;
  protected String coverImage;
  protected String pr;
  protected String gender;
  protected String ageRange;
  protected Boolean use;
  protected boolean flw = false;
  protected List<Integer> favGrList; // 회원 선호 장르의 장르 번호
  protected List<Movie> favMvList;    // 회원 선호 영화 목록
  
  //    프사 & 배사 pathGetter
  public String getProfileImagePath() {
    if (profileImage == null) {
      return "/img/default-profile-img";
    }
    if (profileImage.startsWith("http")) {
      return profileImage;
    } else {
      return "/upload/profile/" + profileImage;
    }
  }
  
  public String getCoverImagePath() {
    if (coverImage == null) {
      return "/img/cover.png";
    } else {
      return "/upload/cover/" + coverImage;
    }
  }

  public int getMno() {
    return mno;
  }

  public void setMno(int mno) {
    this.mno = mno;
  }

  public boolean isAdmin() {
    return admin;
  }

  public void setAdmin(boolean admin) {
    this.admin = admin;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getProfileImage() {
    return profileImage;
  }

  public void setProfileImage(String profileImage) {
    this.profileImage = profileImage;
  }

  public String getCoverImage() {
    return coverImage;
  }
  public void setCoverImage(String coverImage) {
    this.coverImage = coverImage;
  }

  public String getPr() {
    return pr;
  }

  public void setPr(String pr) {
    this.pr = pr;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public String getAgeRange() {
    return ageRange;
  }

  public void setAgeRange(String ageRange) {
    this.ageRange = ageRange;
  }

  public Boolean getUse() {
    return use;
  }

  public void setUse(Boolean use) {
    this.use = use;
  }
  
  public boolean isFlw() {
    return flw;
  }

  public void setFlw(boolean flw) {
    this.flw = flw;
  }

  public List<Integer> getFavGrList() {
    return favGrList;
  }

  public void setFavGrList(List<Integer> favGrList) {
    this.favGrList = favGrList;
  }

  public List<Movie> getFavMvList() {
    return favMvList;
  }

  public void setFavMvList(List<Movie> favMvList) {
    this.favMvList = favMvList;
  }

  @Override
  public String toString() {
    return "Member [getProfileImagePath()=" + getProfileImagePath() + ", getCoverImagePath()="
        + getCoverImagePath() + ", getMno()=" + getMno() + ", isAdmin()=" + isAdmin() + ", getId()="
        + getId() + ", getNickname()=" + getNickname() + ", getProfileImage()=" + getProfileImage()
        + ", getCoverImage()=" + getCoverImage() + ", getPr()=" + getPr() + ", getGender()="
        + getGender() + ", getAgeRange()=" + getAgeRange() + ", getUse()=" + getUse() + ", isFlw()="
        + isFlw() + ", getFavGrList()=" + getFavGrList() + ", getFavMvList()=" + getFavMvList()
        + "]";
  }
  
}
