import 'package:flutter/material.dart';
import 'package:movieapp/api/video_api.dart';
import 'package:movieapp/model/video_model.dart';

class VideoProvider with ChangeNotifier {
  String? _videoKey;
  //To store all trailer videos
  List<VideoModel> _trailers = [];

  String? get videoKey => _videoKey;

  Future<void> getTrailer(int movieId) async {
    _trailers = await VideoApi.getAllTrailerVideos(movieId);
    if (_trailers.isNotEmpty) {
      _videoKey = _trailers.first.key;
    }
    notifyListeners();
  }
}
