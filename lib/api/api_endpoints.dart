class ApiEndpoints {
  //================BASE URLS================
  static const String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String storageUrlw500 = 'https://image.tmdb.org/t/p/w500';
  static const String storageUrlOriginal =
      'https://image.tmdb.org/t/p/original';

  //================MOVIES================
  static const String upcoming = '$baseUrl/upcoming'; //List of movies
  //movieDetails = baseUrl/<movie-id>
  //getImages = baseUrl/<movie-id>/images
  //singleImage = 'storageUrl/file_path
}
