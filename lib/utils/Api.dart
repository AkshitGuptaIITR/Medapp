import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = 'http://192.168.0.2:4000/api/v1';

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

  static Future<Map<String, dynamic>> put(
      String endpoint, dynamic data, String? token) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(data),
    );
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> delete(
      String endpoint, dynamic data, String? token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(data),
    );
    return _processResponse(response);
  }

  static Map<String, dynamic> _processResponse(http.Response response) {
    Map<String, dynamic> result = {
      'statusCode': response.statusCode,
    };
    try {
      // Try to decode the response body as JSON
      result['body'] = jsonDecode(response.body);
    } catch (e) {
      // If an exception occurs, set body to null
      result['body'] = null;
    }
    return result;
  }
}
