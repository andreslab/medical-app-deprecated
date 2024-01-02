import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:heart/models/models.dart';

class AlarmsApi {
  final String _baseUrl = 'localhost.com';

  AlarmsApi();

  Future<List<Alarm>> getData() async {
    var url = Uri.https(_baseUrl, '/records', {'q': '{http}'});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      Iterable jsonResponse = convert.jsonDecode(response.body);
      return List<Alarm>.from(
          jsonResponse.map((model) => Alarm.fromJson(model)));
    } else {
      throw Exception('Failed to load record data');
    }
  }
}
