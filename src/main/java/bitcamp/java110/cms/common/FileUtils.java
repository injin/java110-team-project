package bitcamp.java110.cms.common;

import java.io.File;

public class FileUtils {
  
  public static boolean deleteFile(String filename) {
    
    File file = new File(filename);
    if (!file.isDirectory() && file.isFile()) {
        file.delete();
        if (!file.exists()) {
            return true;
        }
    }
    return false;
}

  
  
}
