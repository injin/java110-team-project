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
  protected String profileImagePath;
  protected String coverImage;
  protected String pr;
  protected String gender;
  protected String ageRange;
  protected List<Integer> favGenres; //  회원 선호 장르의 장르 번호
  
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
  public String getProfileImagePath() {
    if (profileImage == null) {
      return "/img/default-profile-img.png";
    }
    
    if (profileImage.startsWith("http")) {
      return profileImage;
    } else {
      return "/upload/profile/" + profileImage;
    }
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
  public List<Integer> getFavGenres() {
    return favGenres;
  }
  public void setFavGenres(List<Integer> favGenres) {
    this.favGenres = favGenres;
  }
  
  @Override
  public String toString() {
    return "Member [mno=" + mno + ", admin=" + admin + ", id=" + id + ", nickname=" + nickname
        + ", profileImage=" + profileImage + ", coverImage=" + coverImage + ", pr=" + pr
        + ", gender=" + gender + ", ageRange=" + ageRange + ", favGenres=" + favGenres + "]";
  }

}
