import 'package:movieapp/utils/config.dart';

class ApiEndpoints {
  //================BASE URLS================
  static String baseUrl = Config.baseUrl;

  //To get image with it's original size
  static String storageUrlOriginal = Config.storageUrlOriginal;

  //To get image with width=500
  static String storageUrlw500 = Config.storageUrlw500;

  //================MOVIES================
  static String moviesList = '$baseUrl/movie/upcoming'; //List of movies
  static String movieUrl = '$baseUrl/movie';
  static String searchMovie = '$baseUrl/search/movie';
  //movieDetails = baseUrl/<movie-id>
  //getImages = baseUrl/<movie-id>/images
  //singleImage = 'storageUrl/file_path

  //================GENRE================
  static String genresList = '$baseUrl/genre/movie/list'; //List of genres
}
