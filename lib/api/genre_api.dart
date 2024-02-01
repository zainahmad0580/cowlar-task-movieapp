import 'package:http/http.dart' as http;
import 'package:movieapp/api/api_endpoints.dart';
import 'package:movieapp/model/genre_model.dart';
import 'package:movieapp/utils/constants.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:movieapp/utils/utils.dart';

class GenreApi {
  static Future<List<GenreModel>> getAllGenres() async {
    List<GenreModel> genres = [];
    try {
      final uri = Uri.parse(ApiEndpoints.genresList)
          .replace(queryParameters: {'api_key': apiKey});
      final response = await http.get(uri);

      //log('Status code: ${response.statusCode}');
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200 && responseData['genres'] != null) {
        // log(responseData.toString());

        final data = responseData['genres'];
        for (var genre in data) {
          genres.add(GenreModel.fromJson(genre));
          // log(genres.toString());
        }
      } else if (response.statusCode == 401) {
        String? message = responseData['status_message'];
        //To handle if status_message comes null from api
        Utils.toastMessage(msg: message ?? 'Unauthorized access');
      }
    } catch (e) {
      Utils.toastMessage();
      log(e.toString());
    }
    return genres;
  }
}
