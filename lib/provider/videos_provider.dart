import 'package:flutter/material.dart';
import 'package:movieapp/api/video_api.dart';
import 'package:movieapp/model/video_model.dart';

class VideosProvider with ChangeNotifier {
  List<VideoModel> trailers = [];

  Future<void> getTrailers(String movieId) async {
    trailers = await VideoApi.getAllTrailerVideos();
    notifyListeners();
  }
}
