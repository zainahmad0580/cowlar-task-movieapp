class ApiEndpoints {
  //================BASE URLS================
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String storageUrlw500 = 'https://image.tmdb.org/t/p/w500';
  static const String storageUrlOriginal =
      'https://image.tmdb.org/t/p/original';

  //================MOVIES================
  static const String moviesList = '$baseUrl/movie/upcoming'; //List of movies
  static const String movieUrl = '$baseUrl/movie';
  static const String searchMovie = '$baseUrl/search/movie';
  //movieDetails = baseUrl/<movie-id>
  //getImages = baseUrl/<movie-id>/images
  //singleImage = 'storageUrl/file_path

  //================GENRE================
  static const String genresList = '$baseUrl/genre/movie/list'; //List of genres
}
