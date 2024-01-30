class ApiEndpoints {
  //================BASE URLS================
  static const String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String storageUrl =
      'https://benelux.rajaomermustafa.com/storage/';

  //================MOVIES================
  static const String upcoming = '$baseUrl/upcoming';
  static const String register = '$baseUrl/register';
  static const String resendEmail = '$baseUrl/email/verification-notification';
  static const String googleSignUp = '$baseUrl/auth/google/signin';
}
