package bitcamp.java110.cms.web.movieInfo;

import java.util.Iterator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import info.movito.themoviedbapi.TmdbAccount.MovieListResultsPage;
import info.movito.themoviedbapi.TmdbApi;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.TmdbMovies.MovieMethod;
import info.movito.themoviedbapi.TmdbSearch;
import info.movito.themoviedbapi.model.MovieDb;
import info.movito.themoviedbapi.model.core.MovieResultsPage;

@Controller

public class GetMovieTestController {
  
  @Autowired
  Environment env;
  
  public static void main(String[] args) {
    String tmdbKey = "fbfeb547f6dc96b291f6aa6d6975fe42";
    
    //키워드로 영화찾기
    TmdbSearch ts = new TmdbSearch(new TmdbApi(tmdbKey));
    MovieResultsPage response =  ts.searchMovie("베", null , "ko, en", true, 1);
    
    
    System.out.println("totalPages: " + response.getTotalPages());
    System.out.println("totalResults: " + response.getTotalResults());
    
    //List<MovieDb> list = response.getResults();
    Iterator<MovieDb> ita = response.iterator();
    MovieDb md = null;
    while(ita.hasNext()) {
      md = ita.next();
      System.out.println("backdropPath : " + md.getBackdropPath());
      System.out.println("budget : " + md.getBudget());
      System.out.println("homepage : " + md.getHomepage());
      System.out.println("id : " + md.getId());
      System.out.println("imdbId : " + md.getImdbID());
      System.out.println("originalLanguage : " + md.getOriginalLanguage());
      System.out.println("originalTitle : " + md.getOriginalTitle());
      System.out.println("posterPath : " + md.getPosterPath());
      System.out.println("revenue : " + md.getRevenue());
      System.out.println("title : " + md.getTitle());
      System.out.println("genres : " + md.getGenres());
      System.out.println("lists : " + md.getLists());
      System.out.println("================");
    }
    
    
    // 시리즈 찾기
    /*System.out.println("=====================");
    CollectionResultsPage crp = ts.searchCollection("베", "ko-KR", 1);
    System.out.println(crp.getTotalPages());
    System.out.println(crp.getResults());
    
    List<Collection> collections = crp.getResults();
    for (Collection c : collections) {
      System.out.println(c.getName());
    }*/
    
  }
  
  @RequestMapping("/getMovieTest")
  public String getMovie(
      String id,
      Model model) {
    
    
    String tmdbKey = env.getProperty("tmdb.key");
   
    // 아이디로 영화 찾기
    TmdbMovies movies = new TmdbApi(tmdbKey).getMovies();
    MovieDb movie = movies.getMovie(5353, "ko");
    
    MovieDb movie2 = movies.getMovie(78, "ko",
        MovieMethod.credits, MovieMethod.images, 
        MovieMethod.similar);
    
    // 키워드로 영화 찾기
    TmdbSearch ts = new TmdbSearch(new TmdbApi(tmdbKey));
    MovieResultsPage result =  ts.searchMovie("베", null , "ko-KR", true, 1);
    System.out.println("결과1" + result);
    System.out.println("========================");
    
    MovieListResultsPage result2 = ts.searchList("베놈", "ko", 1);
    System.out.println("결과2" + result2);
    
    
    
    
    
    
    //Model model=new Model();
    // TODO themovieDB 에서  데이터 가져오는 작업 하세요
    
    System.out.println(movie.toString());
    model.addAttribute("movieName", movie.getTitle());
    model.addAttribute("genreList",movie.getGenres());
    model.addAttribute("posterPath",movie.getPosterPath());
    model.addAttribute("movieName2", movie2.getTitle());
    model.addAttribute("genreList2",movie2.getGenres());
    model.addAttribute("posterPath2",movie2.getPosterPath());
    model.addAttribute("getImages",movie2.getImages());
    model.addAttribute("getCredits",movie2.getCredits());
    model.addAttribute("getSimilarMovies",movie2.getSimilarMovies());

    


    //=========================================
    
    
    return "test/getMovieTest";
  }
}
