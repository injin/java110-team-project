package bitcamp.java110.cms.common;

public class CharacterConverter {
  
  public static String convert(String text) {
    if (text == null)
      return null;
    
    return text.replaceAll("(\r\n|\n)", "<br>")
               .replaceAll("'", "&#39;")
               .replaceAll("\"", "&quot;");
  }
  
}
