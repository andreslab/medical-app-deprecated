import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;
  String _titleAppBar = 'Resumen';

  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int index) {
    _selectedMenuOpt = index;
    notifyListeners();
  }

  String get selectedTitleAppBar {
    return _titleAppBar;
  }

  set selectedTitleAppBar(String title) {
    _titleAppBar = title;
    notifyListeners();
  }
}
