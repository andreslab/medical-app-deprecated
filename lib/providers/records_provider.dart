import 'package:flutter/material.dart';
import 'package:heart/api/api.dart';
import 'package:heart/api/device_api.dart';
import 'package:heart/models/models.dart';
import 'package:heart/providers/providers.dart';
import 'package:heart/storage/storage.dart';
import 'package:sqflite/sqflite.dart';

class RecordsProvider extends ChangeNotifier {
  final RecordsApi _recordsApi = RecordsApi();
  final DeviceApi _deviceApi = DeviceApi();
  late final Storage _storage = Storage();
  final tableName = 'records';
  final AuthProvider? _authProvider;
  List<Record> _records = [];
  String _errorMessage = '';
  bool _isLoading = true;

  List<Record> get records => _records;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  RecordsProvider([this._authProvider]) {
    if (_authProvider != null && _authProvider!.loggedIn) {
      getRecords();
    } else {
      _deviceApi.registerDeviceId();
      getRecordsFromDB();
    }
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

  getRecordsFromDB() async {
    await _storage.initDatabase();
    final List<Map<String, dynamic>> recordsFromDB =
        await _storage.db.query(tableName);
    _records =
        List<Record>.from(recordsFromDB.map((model) => Record.fromJson(model)));
    notifyListeners();
  }

  createRecordSample() async {
    await _storage.someDatabaseOperation();
    await getRecordsFromDB();
    notifyListeners();
  }

  createRecord(Record record) async {
    if (_authProvider!.loggedIn) {
      //TODO: send to endpoint
    } else {
      await _storage.db.insert(
        tableName,
        record.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      await getRecordsFromDB();
    }
  }

  updateRecord(Record record) async {
    if (_authProvider!.loggedIn) {
      //TODO: send to endpoint
    } else {
      await _storage.db.update(tableName, record.toMap(),
          where: 'id = ?', whereArgs: [record.id]);
    }
  }

  deleteRecord(int id) async {
    if (_authProvider!.loggedIn) {
      //TODO: send to endpoint
    } else {
      await _storage.db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    }
  }
}
