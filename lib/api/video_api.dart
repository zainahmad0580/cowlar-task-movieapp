import 'package:http/http.dart' as http;
import 'package:movieapp/api/api_endpoints.dart';
import 'package:movieapp/model/video_model.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:movieapp/utils/constants.dart';
import 'package:movieapp/utils/utils.dart';

class VideoApi {
  static Future<List<VideoModel>> getAllTrailerVideos(int movieId) async {
    List<VideoModel> videos = [];
    try {
      //IF USER IS NOT CONNECTED TO THE INTERNET
      if (!await Utils.isConnected()) return videos;

      final uri = Uri.parse('${ApiEndpoints.movieUrl}/$movieId/videos')
          .replace(queryParameters: {'api_key': apiKey});
      final response = await http.get(uri);

      //log('Status code: ${response.statusCode}');
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200 && responseData['results'] != null) {
        // log(responseData.toString());

        final data = responseData['results'];
        for (var video in data) {
          //To add only trailer videos
          if (video['type'] != null && video['type'] == 'Trailer') {
            videos.add(VideoModel.fromJson(video));
          }
          // log(videos.toString());
        }
      } else if (response.statusCode == 401) {
        String? message = responseData['status_message'];
        //To handle if status_message comes null from api
        Utils.toastMessage(msg: message ?? 'Unauthorized access');
      }
    } catch (e) {
      log(e.toString());
    }
    if (videos.isEmpty) {
      Utils.toastMessage(msg: 'Trailer not found');
    }
    return videos;
  }
}
