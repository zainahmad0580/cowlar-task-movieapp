import 'package:flutter/material.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/utils/config.dart';

enum MQTTAppConnectionState { connected, disconnected, connecting }

const String youtubeUrl = 'https://www.youtube.com/watch?v=';

String apiKey = Config.apiKey;

const Map<String, Color> genreColors = {
  'Action': AppColors.genreTeal,
  'Thriller': AppColors.genrePink,
  'Science': AppColors.genrePurpe,
  'Fiction': AppColors.genreYellow
};
