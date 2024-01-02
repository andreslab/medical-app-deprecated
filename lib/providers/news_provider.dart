import 'package:flutter/material.dart';
import 'package:heart/api/api.dart';
import 'package:heart/models/models.dart';

class NewsProvider extends ChangeNotifier {
  final NewsApi _newsApi = NewsApi();
  List<News> _news = [];
  String _errorMessage = '';
  bool _isLoading = true;

  List<News> get news => _news;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  NewsProvider() {
    getRecords();
  }

  getRecords() async {
    try {
      _isLoading = true;
      notifyListeners();
      _news = await _newsApi.getData();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
