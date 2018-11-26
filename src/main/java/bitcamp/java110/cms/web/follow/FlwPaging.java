package bitcamp.java110.cms.web.follow;

public class FlwPaging {

    protected int totalcount;
    protected int pageNo;
    protected int pageSize;
    protected int startPage =1;
    protected int endPage=5;
    protected boolean prev=false;
    protected boolean next;
    protected int currentblock=1;
    protected int lastblock;
    
    public void prevnext(int pageNo) {
        
        if(pageNo>0 && pageNo<6) {
            setPrev(false);
            setNext(true);
        }
        else if(getLastblock() == getCurrentblock()){
            setPrev(true);
            setNext(false);
        }
        else {
            setPrev(true);
            setNext(true);
        }
    }
    
    public int calcpage(int totalcount, int pageSize) {

        int totalpage = totalcount/pageSize;
        if(totalcount%pageSize>0) {
            totalpage++;
        }
        return totalpage;
    }
    
    public int getTotalcount() {
        return totalcount;
    }
    public void setTotalcount(int totalcount) {
        this.totalcount = totalcount;
    }
    public int getPageNo() {
        return pageNo;
    }
    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public int getStartPage() {
        return startPage;
    }
    public void setStartPage(int currentblock) {
       
        this.startPage = (currentblock*5)-4;
    }
    public int getEndPage() {
        return endPage;
    }
    public void setEndPage(int getlastblock, int getcurrentblock) {
        
        if(getlastblock == getcurrentblock) {
            this.endPage = calcpage(getTotalcount(), getPageSize());
        }
        else{
            this.endPage = getStartPage()+4;
        }
    }
    public boolean isPrev() {
        return prev;
    }
    public void setPrev(boolean prev) {
        this.prev = prev;
    }
    public boolean isNext() {
        return next;
    }
    public void setNext(boolean next) {
        this.next = next;
    }
    public int getCurrentblock() {
        return currentblock;
    }
    public void setCurrentblock(int pageNo) {
        this.currentblock = pageNo/5;
        if(pageNo%5>=0) {
            this.currentblock++;
        }
    }
    public int getLastblock() {
        return lastblock;
    }
    public void setLastblock(int totalcount) {
        
        this.lastblock = totalcount/(5*this.pageSize);
        if(totalcount%(5*this.pageSize)>0) {
            this.lastblock++;
        }
    }
    
    
    
    @Override
    public String toString() {
        return "FlwPaging [totalcount=" + totalcount + ", pageNo=" + pageNo + ", pageSize=" + pageSize + ", startPage="
                + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", currentblock="
                + currentblock + ", lastblock=" + lastblock + "]";
    }
    
    
    

}


