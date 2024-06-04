import 'package:flutter/material.dart';
import 'package:heart/api/api.dart';

class AuthProvider extends ChangeNotifier {
  final AuthApi _authApi = AuthApi();
  String _errorMessage = '';
  bool _isLoading = true;
  bool _loggedIn = false;
  bool _isDeviceRegisted = false;

  bool get loggedIn => _loggedIn;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isDeviceRegisted => _isDeviceRegisted;

  AuthProvider() {}

  login() async {
    try {
      await _authApi.login();
    } catch (e) {}
  }

  register() async {
    try {
      await _authApi.register();
    } catch (e) {}
  }
}
