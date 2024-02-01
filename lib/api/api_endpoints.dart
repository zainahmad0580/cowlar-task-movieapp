import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  //================BASE URLS================
  static String baseUrl = dotenv.get('BASE_URL', fallback: '');

  //To get image with width=500
  static String storageUrlw500 = dotenv.get('STORAGE_URL_W500', fallback: '');

  //To get image with it's original size
  static String storageUrlOriginal =
      dotenv.get('STORAGE_URL_ORIGINAL', fallback: '');

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
