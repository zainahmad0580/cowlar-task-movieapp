import 'package:flutter/material.dart';
import 'package:movieapp/api/genre_api.dart';
import 'package:movieapp/model/genre_model.dart';

class GenreProvider with ChangeNotifier {
  List<GenreModel> _genres = [];

  List<GenreModel> get genres => _genres;

  Future<void> setGenres() async {
    _genres = await GenreApi.getAllGenres();
    notifyListeners();
  }
}
