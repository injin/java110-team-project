package bitcamp.java110.cms.domain;

import java.sql.Date;

public class Mlog  {
  
  protected int lgno;
  protected int mno;
  protected String direct;
  protected String nick;
  protected String indirect;
  protected String act;
  protected String url;
  protected Date createdDate;
  protected String text;
  
  public int getLgno() {
    return lgno;
  }
  public void setLgno(int lgno) {
    this.lgno = lgno;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public String getDirect() {
    return direct;
  }
  public void setDirect(String direct) {
    this.direct = direct;
  }
  public String getIndirect() {
    return indirect;
  }
  public void setIndirect(String indirect) {
    this.indirect = indirect;
  }
  public String getAct() {
    return act;
  }
  public void setAct(String act) {
    this.act = act;
  }
  public String getUrl() {
    return url;
  }
  public void setUrl(String url) {
    this.url = url;
  }
  public Date getCreatedDate() {
    return createdDate;
  }
  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }
  public String getText() {
    return text;
  }
  public void setText(String text) {
    this.text = text;
  }
  
  public String getNick() {
    return nick;
  }
  public void setNick(String nick) {
    this.nick = nick;
  }
  @Override
  public String toString() {
    return "Mlog [lgno=" + lgno + ", mno=" + mno + ", direct=" + direct + ", nick=" + nick
        + ", indirect=" + indirect + ", act=" + act + ", url=" + url + ", createdDate="
        + createdDate + ", text=" + text + "]";
  }
  
  
}
