import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:heart/models/models.dart';

class AuthApi {
  final String _baseUrl = 'localhost.com';

  AuthApi();

  // Future<User> logIn() async {
  //   var url = Uri.https(_baseUrl, '/records', {'q': '{http}'});

  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var jsonResponse = convert.jsonDecode(response.body) as User;
  //     return jsonResponse;
  //   } else {
  //     throw Exception('Failed to load record data');
  //   }
  // }
}
