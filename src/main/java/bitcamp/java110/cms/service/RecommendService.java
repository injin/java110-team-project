package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.domain.Movie;
import java.util.Map;
import bitcamp.java110.cms.domain.Theme;
import info.movito.themoviedbapi.model.MovieDb;

public interface RecommendService {
  String getListName(int thmno);
  List<MovieDb> getList(int thmno);
  List<Movie> getRcmdMvList(int thmno);
  List<Theme> getAllTitle();
  void addMovieList(Theme theme ,List<Movie> movieList);
  MovieDb getMvById(int mvno);
  int[] RandomNums(int root, int range);
  int getCount();
  Map<String, Object> getKey(int mno);
}
