import 'package:http/http.dart' as http;
import 'package:movieapp/api/api_endpoints.dart';
import 'package:movieapp/data/moor_database.dart';
import 'package:movieapp/model/genre_model.dart';
import 'package:movieapp/utils/constants.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:movieapp/utils/utils.dart';

class GenreApi {
  static final _database = AppDatabase.instance;
  static Future<List<GenreModel>> getAllGenres() async {
    List<GenreModel> genres = [];
    try {
      //IF USER IS NOT CONNECTED TO THE INTERNET
      if (!await Utils.isConnected()) {
        // Retrieve genres from the local database
        genres = await _database.getAllGenres();
      } else {
        // Else retrieve genres from the api database
        final uri = Uri.parse(ApiEndpoints.genresList)
            .replace(queryParameters: {'api_key': apiKey});
        final response = await http.get(uri);

        //log('Status code: ${response.statusCode}');
        final responseData = jsonDecode(response.body);
        if (response.statusCode == 200 && responseData['genres'] != null) {
          // log(responseData.toString());

          final data = responseData['genres'];
          genres = data
              .map<GenreModel>((genre) => GenreModel.fromJson(genre))
              .toList();

          // Insert fetched genres into the local database
          await _database.insertGenres(genres);
          log('Geting all genres from api');
          log('${genres.length}');
        } else if (response.statusCode == 401) {
          String? message = responseData['status_message'];
          //To handle if status_message comes null from api
          Utils.toastMessage(msg: message ?? 'Unauthorized access');
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return genres;
  }
}
