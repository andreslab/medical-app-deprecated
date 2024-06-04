import 'package:flutter/material.dart';
import 'package:heart/api/api.dart';
import 'package:heart/models/models.dart';
import 'package:heart/providers/providers.dart';
import 'package:heart/storage/storage.dart';
import 'package:sqflite/sqflite.dart';

class AlarmsProvider extends ChangeNotifier {
  final AlarmsApi _alarmsApi = AlarmsApi();
  final tableName = 'alarms';
  final AuthProvider? _authProvider;
  List<Alarm> _alarms = [];
  String _errorMessage = '';
  bool _isLoading = true;

  List<Alarm> get alarms => _alarms;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  AlarmsProvider([this._authProvider]) {
    if (_authProvider != null && _authProvider!.loggedIn) {
      getAlarms();
    } else {
      if (Storage.db != null) {
        getAlarmsFromDB();
      }
    }
  }

  getAlarms() async {
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

  getAlarmsFromDB() async {
    final List<Map<String, dynamic>> alarmsFromDB =
        await Storage.db.query(tableName);
    _alarms =
        List<Alarm>.from(alarmsFromDB.map((model) => Alarm.fromJson(model)));
    notifyListeners();
  }

  createAlarm(Alarm alarm) async {
    if (_authProvider!.loggedIn) {
      //TODO: send to endpoint
    } else {
      await Storage.db.insert(
        tableName,
        alarm.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  updateAlarm(Alarm alarm) async {
    if (_authProvider!.loggedIn) {
      //TODO: send to endpoint
    } else {
      await Storage.db.update(tableName, alarm.toMap(),
          where: 'id = ?', whereArgs: [alarm.id]);
    }
  }

  deleteRecord(int id) async {
    if (_authProvider!.loggedIn) {
      //TODO: send to endpoint
    } else {
      await Storage.db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    }
  }
}
