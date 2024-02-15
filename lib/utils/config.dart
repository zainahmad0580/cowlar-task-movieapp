import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String apiKey = dotenv.get('API_KEY', fallback: '');
  static String baseUrl = dotenv.get('BASE_URL', fallback: '');
  static String storageUrlOriginal =
      dotenv.get('STORAGE_URL_ORIGINAL', fallback: '');
  static String storageUrlw500 = dotenv.get('STORAGE_URL_W500', fallback: '');
}
