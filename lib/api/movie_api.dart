import 'package:http/http.dart' as http;
import 'package:movieapp/api/api_endpoints.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/utils/utils.dart';

class MovieApi {
  static Future<List<MovieModel>> getAllMovies() async {
    List<MovieModel> movies = [];
    try {
      final response = await http.get(Uri.parse(ApiEndpoints.upcoming));

      log('Status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        log(responseData.toString());
        bool? isError = responseData['error'];
        if (isError != null) {
          String message = responseData['message'];
          if (isError) {
            Utils.toastMessage(msg: message);
          } else {
            final data = responseData['data'];
            for (var movie in data) {
              movies.add(MovieModel.fromJson(movie));
              log(movies.toString());
            }
          }
        } else {
          Utils.toastMessage();
        }
      } else {
        Utils.toastMessage();
      }
    } catch (e) {
      log(e.toString());
    }
    return movies;
  }
}
