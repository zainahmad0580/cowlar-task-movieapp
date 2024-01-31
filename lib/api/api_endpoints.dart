class ApiEndpoints {
  //================BASE URLS================
  static const String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String storageUrlw500 = 'https://image.tmdb.org/t/p/w500';
  static const String storageUrlOriginal =
      'https://image.tmdb.org/t/p/original';

  //================MOVIES================
  static const String upcoming = '$baseUrl/upcoming';
  static const String register = '$baseUrl/register';
  static const String resendEmail = '$baseUrl/email/verification-notification';
  static const String googleSignUp = '$baseUrl/auth/google/signin';
}
