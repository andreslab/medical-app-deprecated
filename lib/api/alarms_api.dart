import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:heart/models/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AlarmsApi {
  final String _baseUrl = 'localhost.com';

  AlarmsApi();

  // Future<List<Alarm>> getData() async {
  //   var url = Uri.https(_baseUrl, '/alarms', {'q': '{http}'});

  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     Iterable jsonResponse = convert.jsonDecode(response.body);
  //     return List<Alarm>.from(
  //         jsonResponse.map((model) => Alarm.fromJson(model)));
  //   } else {
  //     throw Exception('Failed to load record data');
  //   }
  // }

  Future<List<Alarm>> getData() async {
    try {
      final List<Map<String, dynamic>> response =
          await Supabase.instance.client.from('alarms').select();
      return List<Alarm>.from(response.map((model) => Alarm.fromJson(model)));
    } on Exception catch (e) {
      throw Exception('Failed to load record data: ${e.toString()}');
    }
  }
}
