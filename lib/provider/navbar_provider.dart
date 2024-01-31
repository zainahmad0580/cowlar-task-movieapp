import 'package:flutter/material.dart';

class NavBarProvider with ChangeNotifier {
  int? _index = 1;

  int? get index => _index;

  void changeIndex(newIndex) {
    _index = newIndex;
    notifyListeners();
  }
}
