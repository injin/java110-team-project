package bitcamp.java110.cms.domain;

import java.sql.Date;
import java.util.List;

public class Report {

  protected int rptno;
  protected int mno;
  protected String target;
  protected String cont;
  protected String url;
  protected boolean hndl;
  protected Date createdDate;
  protected String nick;
  
  protected List<String> types;
  

  public int getRptno() {
    return rptno;
  }
  public void setRptno(int rptno) {
    this.rptno = rptno;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public String getTarget() {
    return target;
  }
  public void setTarget(String target) {
    this.target = target;
  }
  public String getCont() {
    return cont;
  }
  public void setCont(String cont) {
    this.cont = cont.replaceAll("(\r\n|\n)", "<br>");
  }
  public String getUrl() {
    return url;
  }
  public void setUrl(String url) {
    this.url = url;
  }
  public boolean isHndl() {
    return hndl;
  }
  public void setHndl(boolean hndl) {
      this.hndl = hndl;
  }
  public Date getCreatedDate() {
    return createdDate;
  }
  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }
  public List<String> getTypes() {
    return types;
  }
  public void setTypes(List<String> types) {
    this.types = types;
  }

public String getNick() {
    return nick;
}

public void setNick(String nick) {
    this.nick = nick;
}

@Override
public String toString() {
    return "Report [rptno=" + rptno + ", mno=" + mno + ", target=" + target + ", cont=" + cont + ", url=" + url
            + ", hndl=" + hndl + ", createdDate=" + createdDate + ", nick=" + nick + ", types=" + types + "]";
}
  
  
  
  
}
