import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieapp/utils/app_colors.dart';

const String youtubeUrl = 'https://www.youtube.com/watch?v=';
String apiKey = dotenv.get('API_KEY', fallback: '');

const Map<String, Color> genreColors = {
  'Action': AppColors.genreTeal,
  'Thriller': AppColors.genrePink,
  'Science': AppColors.genrePurpe,
  'Fiction': AppColors.genreYellow
};
