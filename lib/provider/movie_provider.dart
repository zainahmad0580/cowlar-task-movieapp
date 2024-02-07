import 'package:flutter/material.dart';
import 'package:movieapp/api/movie_api.dart';
import 'package:movieapp/model/movie_model.dart';

class MovieProvider with ChangeNotifier {
  List<MovieModel> _movies = [];

  List<MovieModel> get movies => _movies;

  Future<void> setMovies() async {
    _movies = await MovieApi.getAllMovies();
    notifyListeners();
  }
}
