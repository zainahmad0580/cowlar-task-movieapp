import 'package:http/http.dart' as http;
import 'package:movieapp/api/api_endpoints.dart';
import 'package:movieapp/data/moor_database.dart';
import 'package:movieapp/model/movie_details_model.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/utils/constants.dart';
import 'package:movieapp/utils/utils.dart';

class MovieApi {
  static final _database = AppDatabase.instance;
  static Future<List<MovieModel>> getAllMovies() async {
    List<MovieModel> movies = [];
    try {
      //IF USER IS NOT CONNECTED TO THE INTERNET
      if (!await Utils.isConnected()) {
        // Retrieve movies from the local database
        movies = await _database.getAllMovies();
      } else {
        // If no movies are found in the database, fetch them from the api
        final uri = Uri.parse(ApiEndpoints.moviesList)
            .replace(queryParameters: {'api_key': apiKey});
        final response = await http.get(uri);

        final responseData = jsonDecode(response.body);
        if (response.statusCode == 200 && responseData['results'] != null) {
          final data = responseData['results'];
          movies = data
              .map<MovieModel>((movie) => MovieModel.fromJson(movie))
              .toList();

          // Insert fetched movies into the local database
          await _database.insertMovies(movies);
          log('Geting all movies from api');
          log('${movies.length}');
        } else if (response.statusCode == 401) {
          String? message = responseData['status_message'];
          Utils.toastMessage(msg: message ?? 'Unauthorized access');
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return movies;
  }

  static Future<List<MovieModel>> searchMovies(String query) async {
    List<MovieModel> movies = [];
    try {
      final uri = Uri.parse(ApiEndpoints.searchMovie)
          .replace(queryParameters: {'query': query, 'api_key': apiKey});
      final response = await http.get(uri);

      //log('Status code: ${response.statusCode}');
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200 && responseData['results'] != null) {
        // log(responseData.toString());

        final data = responseData['results'];
        for (var movie in data) {
          movies.add(MovieModel.fromJson(movie));
          // log(movies.toString());
        }
      } else if (response.statusCode == 401) {
        String? message = responseData['status_message'];
        //To handle if status_message comes null from api
        Utils.toastMessage(msg: message ?? 'Unauthorized access');
      }
    } catch (e) {
      log(e.toString());
    }
    return movies;
  }

  static Future<MovieDetailsModel?> getMovieDetails(int movieId) async {
    MovieDetailsModel? movieDetailsModel;
    try {
      //IF USER IS NOT CONNECTED TO THE INTERNET
      if (!await Utils.isConnected()) return movieDetailsModel;

      final uri = Uri.parse('${ApiEndpoints.movieUrl}/$movieId')
          .replace(queryParameters: {'api_key': apiKey});
      final response = await http.get(uri);

      //log('Status code: ${response.statusCode}');
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        movieDetailsModel = MovieDetailsModel.fromJson(responseData);
      } else if (response.statusCode == 401) {
        String? message = responseData['status_message'];
        //To handle if status_message comes null from api
        Utils.toastMessage(msg: message ?? 'Unauthorized access');
      }
    } catch (e) {
      log(e.toString());
    }
    return movieDetailsModel;
  }
}
