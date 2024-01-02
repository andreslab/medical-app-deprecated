import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:heart/models/models.dart';

class RecordsApi {
  final String _baseUrl = 'localhost.com';

  RecordsApi();

  Future<List<Record>> getData() async {
    var url = Uri.https(_baseUrl, '/records', {'q': '{http}'});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      Iterable jsonResponse = convert.jsonDecode(response.body);
      return List<Record>.from(
          jsonResponse.map((model) => Record.fromJson(model)));
    } else {
      throw Exception('Failed to load record data');
    }
  }
}
