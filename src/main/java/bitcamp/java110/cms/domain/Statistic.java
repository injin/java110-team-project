package bitcamp.java110.cms.domain;

public class Statistic {

    
     protected int mno;
     protected int grno;
     protected String gr_nm;
     
    public int getMno() {
        return mno;
    }
    public void setMno(int mno) {
        this.mno = mno;
    }
    public int getGrno() {
        return grno;
    }
    public void setGrno(int grno) {
        this.grno = grno;
    }
    public String getGr_nm() {
        return gr_nm;
    }
    public void setGr_nm(String gr_nm) {
        this.gr_nm = gr_nm;
    }
    
    @Override
    public String toString() {
        return "Statistic [mno=" + mno + ", grno=" + grno + ", gr_nm=" + gr_nm + "]";
    }
    
    
   
     
     
}
