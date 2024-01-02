import 'package:flutter/material.dart';
import 'package:heart/api/api.dart';
import 'package:heart/models/models.dart';

class AlarmsProvider extends ChangeNotifier {
  final AlarmsApi _alarmsApi = AlarmsApi();
  List<Alarm> _alarms = [];
  String _errorMessage = '';
  bool _isLoading = true;

  List<Alarm> get alarms => _alarms;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  AlarmsProvider() {
    getRecords();
  }

  getRecords() async {
    try {
      _isLoading = true;
      notifyListeners();
      _alarms = await _alarmsApi.getData();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
