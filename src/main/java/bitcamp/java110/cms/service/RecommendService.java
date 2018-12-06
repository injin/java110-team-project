package bitcamp.java110.cms.service;

import java.util.List;
import info.movito.themoviedbapi.model.MovieDb;

public interface RecommendService {
  String getListName(int thmno);
  List<MovieDb> getList(int thmno);
  MovieDb getMvById(int mvno);
  int[] RandomNums(int root, int range);
  int getCount();
  void getAnly(int mno);
}
