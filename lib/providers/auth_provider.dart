import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _errorMessage = '';
  bool _isLoading = true;
  bool _loggedIn = false;
  bool _isDeviceRegisted = false;

  bool get loggedIn => _loggedIn;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isDeviceRegisted => _isDeviceRegisted;

  login() async {}
  register() async {}
}
