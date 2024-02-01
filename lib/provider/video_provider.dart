import 'package:flutter/material.dart';
import 'package:movieapp/api/video_api.dart';
import 'package:movieapp/model/video_model.dart';

class VideoProvider with ChangeNotifier {
  String? _videoKey;
  List<VideoModel> _trailers = [];

  String? get videoKey => _videoKey;

  Future<void> getTrailers(String movieId) async {
    _trailers = await VideoApi.getAllTrailerVideos();
    if (_trailers.isNotEmpty) {
      _videoKey = _trailers.first.key;
    }

    notifyListeners();
  }
}
