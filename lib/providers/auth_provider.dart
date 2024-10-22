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

  signIn(String email, String password) async {
    try {
      await _authApi.signIn(email, password);
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

  signUp(String email, String password) async {
    try {
      await _authApi.singUp(email, password);
    } catch (e) {}
  }
}
