import 'package:flutter/material.dart';
import 'package:heart/api/api.dart';

class AuthProvider extends ChangeNotifier {
  final AuthApi _authApi = AuthApi();
  String _errorMessage = '';
  bool _isLoading = false;
  bool _isSignedIn = false;
  bool _isDeviceRegisted = false;

  bool get isSignedIn => _isSignedIn;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isDeviceRegisted => _isDeviceRegisted;

  // AuthProvider() {}

  signIn() async {
    try {
      await _authApi.signIn();
      _isSignedIn = true;
      notifyListeners();
    } catch (e) {}
  }

  signOut() async {
    try {
      await _authApi.signOut();
      _isSignedIn = false;
    } catch (e) {}
  }

  register() async {
    try {
      await _authApi.register();
    } catch (e) {}
  }
}
