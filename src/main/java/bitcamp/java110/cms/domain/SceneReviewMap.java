package bitcamp.java110.cms.domain;

public class SceneReviewMap {
  
  protected int mpno;
  protected int cmno;
  protected String mapName;
  protected Double lat;
  protected Double lng;
  
  public int getMpno() {
    return mpno;
  }
  public void setMpno(int mpno) {
    this.mpno = mpno;
  }
  public int getCmno() {
    return cmno;
  }
  public void setCmno(int cmno) {
    this.cmno = cmno;
  }
  public String getMapName() {
    return mapName;
  }
  public void setMapName(String mapName) {
    this.mapName = mapName;
  }
  public Double getLat() {
    return lat;
  }
  public void setLat(Double lat) {
    this.lat = lat;
  }
  public Double getLng() {
    return lng;
  }
  public void setLng(Double lng) {
    this.lng = lng;
  }
  
  @Override
  public String toString() {
    return "SceneReviewMap [mpno=" + mpno + ", cmno=" + cmno + ", mapName=" + mapName + ", lat="
        + lat + ", lng=" + lng + "]";
  }
}
