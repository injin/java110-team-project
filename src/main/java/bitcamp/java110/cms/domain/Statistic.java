package bitcamp.java110.cms.domain;

public class Statistic {

     protected int mno;
     protected int grno;
     protected String gr_nm;
     protected int mvno;
     protected double star;
     protected double cnt;
     protected String titl;
     
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
    public int getMvno() {
        return mvno;
    }
    public void setMvno(int mvno) {
        this.mvno = mvno;
    }
    public double getStar() {
        return star;
    }
    public void setStar(double star) {
        this.star = star;
    }
    public double getCnt() {
        return cnt;
    }
    public void setCnt(double cnt) {
        this.cnt = cnt;
    }
    public String getTitl() {
        return titl;
    }
    public void setTitl(String titl) {
        this.titl = titl;
    }
    
    @Override
    public String toString() {
        return "Statistic [mno=" + mno + ", grno=" + grno + ", gr_nm=" + gr_nm + ", mvno=" + mvno + ", star=" + star
                + ", cnt=" + cnt + ", titl=" + titl + "]";
    }
     
     
}
