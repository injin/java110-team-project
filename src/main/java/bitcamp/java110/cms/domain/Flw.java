package bitcamp.java110.cms.domain;

import java.io.Serializable;

public class Flw extends Member implements Serializable {

    private static final long serialVersionUID = 1L;
    
    int mno;
    int flw;
    
    
    public int getMno() {
        return mno;
    }
    public void setMno(int mno) {
        this.mno = mno;
    }
    public int getFlw() {
        return flw;
    }
    public void setFlw(int flw) {
        this.flw = flw;
    }
    
    @Override
    public String toString() {
        return "Flw [mno=" + mno + ", flw=" + flw + "]";
    }
    
    
    
    
    
}
