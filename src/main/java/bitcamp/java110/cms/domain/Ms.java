package bitcamp.java110.cms.domain;

import java.io.Serializable;

public class Ms implements Serializable{

    private static final long serialVersionUID = 1L;
    
    int no;
    String name;
    String type;
    String cont;
    String phot;
    
    
    public int getNo() {
        return no;
    }
    public void setNo(int no) {
        this.no = no;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getCont() {
        return cont;
    }
    public void setCont(String cont) {
        this.cont = cont;
    }
    public String getPhot() {
        return phot;
    }
    public void setPhot(String phot) {
        this.phot = phot;
    }
    
    @Override
    public String toString() {
        return "Ms [no=" + no + ", name=" + name + ", type=" + type + ", cont=" + cont + ", phot=" + phot + "]";
    }
    
    
}
