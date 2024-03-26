import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = 'http://192.168.0.7:4000/api/v1';

  static Future<Map<String, dynamic>> get(String endpoint, String token) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'), headers: {
      "Authorization": 'Bearer $token',
    });
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data, String? token) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(data),
    );
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$baseUrl$endpoint'));
    return _processResponse(response);
  }

  static Map<String, dynamic> _processResponse(http.Response response) {
    final Map<String, dynamic> result = {
      'statusCode': response.statusCode,
      'body': jsonDecode(response.body),
    };
    return result;
  }
}
