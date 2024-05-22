import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:heart/models/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewsApi {
  final String _baseUrl = 'localhost.com';

  NewsApi();

  // Future<List<News>> getData() async {
  //   var url = Uri.https(_baseUrl, '/records', {'q': '{http}'});

  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     Iterable jsonResponse = convert.jsonDecode(response.body);
  //     return List<News>.from(jsonResponse.map((model) => News.fromJson(model)));
  //   } else {
  //     throw Exception('Failed to load record data');
  //   }
  // }

  Future<List<News>> getData() async {
    try {
      final List<Map<String, dynamic>> response =
          await Supabase.instance.client.from('news').select();
      return List<News>.from(response.map((model) => News.fromJson(model)));
    } on Exception catch (e) {
      throw Exception('Failed to load record data: ${e.toString()}');
    }
  }
}
