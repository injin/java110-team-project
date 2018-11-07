package bitcamp.java110.cms.domain;

import java.io.Serializable;


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
  protected String age;
  
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
  public String getAge() {
    return age;
  }
  public void setAge(String age) {
    this.age = age;
  }
  
  @Override
  public String toString() {
    return "Member [mno=" + mno + ", admin=" + admin + ", id=" + id + ", nickname=" + nickname
        + ", profileImage=" + profileImage + ", coverImage=" + coverImage + ", pr=" + pr
        + ", gender=" + gender + ", age=" + age + "]";
  }

}
