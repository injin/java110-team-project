package bitcamp.java110.cms.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import info.movito.themoviedbapi.TmdbApi;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.TmdbMovies.MovieMethod;
import info.movito.themoviedbapi.model.MovieDb;

@Controller

public class GetMovieTestController {
  
  @Autowired
  Environment env;
  
  @RequestMapping("/getMovieTest")
  public String getMovie(
      String id,
      Model model) {
    
    
    String tmdbKey = env.getProperty("tmdb.key");
   
    TmdbMovies movies = new TmdbApi(tmdbKey).getMovies();
    MovieDb movie = movies.getMovie(5353, "ko");
    
    MovieDb movie2 = movies.getMovie(78, "ko",
        MovieMethod.credits, MovieMethod.images, 
        MovieMethod.similar);
    
    
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
