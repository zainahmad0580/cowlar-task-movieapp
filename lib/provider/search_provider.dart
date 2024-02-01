import 'package:flutter/material.dart';
import 'package:movieapp/model/movie_model.dart';

class SearchProvider with ChangeNotifier {
  List<MovieModel> _searchedMovies = [];
  String _query = '';

  List<MovieModel> get searchedMovies => _searchedMovies;
  String get query => _query;

  void setQuery(input) {
    _query = input;
    notifyListeners();
  }

  void clearQuery() {
    _query = '';
    notifyListeners();
  }
}
