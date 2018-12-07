package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.domain.Theme;
import info.movito.themoviedbapi.model.MovieDb;

public interface RecommendService {
  String getListName(int thmno);
  List<MovieDb> getList(int thmno);
  List<Theme> getAllTitle();
  MovieDb getMvById(int mvno);
  int[] RandomNums(int root);
  int getCount();
}
