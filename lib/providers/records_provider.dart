import 'package:flutter/material.dart';
import 'package:heart/api/api.dart';
import 'package:heart/models/models.dart';

class RecordsProvider extends ChangeNotifier {
  final RecordsApi _recordsApi = RecordsApi();
  List<Record> _records = [];
  String _errorMessage = '';
  bool _isLoading = true;

  List<Record> get records => _records;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  RecordsProvider() {
    getRecords();
  }

  getRecords() async {
    try {
      _isLoading = true;
      notifyListeners();
      _records = await _recordsApi.getData();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
