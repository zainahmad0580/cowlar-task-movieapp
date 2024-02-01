import 'package:flutter/material.dart';
import 'package:movieapp/api/movie_api.dart';
import 'package:movieapp/model/movie_model.dart';

class SearchProvider with ChangeNotifier {
  List<MovieModel> _searchedMovies = [];
  String _query = '';

  List<MovieModel> get searchedMovies => _searchedMovies;
  String get query => _query;

  Future<void> setQuery(input) async {
    _query = input;
    _searchedMovies = await MovieApi.searchMovies(_query);
    notifyListeners();
  }

  void clearQuery() {
    _query = '';
    notifyListeners();
  }
}
