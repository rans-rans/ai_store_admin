import 'package:http/http.dart' as http;

import 'network_response.dart';

class NetworkRequest {
  static Future<NetworkResponse> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers,
      );
      return NetworkResponse(
        statusCode: response.statusCode,
        body: response.body,
        header: response.headers,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<NetworkResponse> get({
    required String url,
    Map<String, String>? header,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: header,
      );
      return NetworkResponse(
        statusCode: response.statusCode,
        body: response.body,
        header: response.headers,
      );
    } catch (e) {
      rethrow;
    }
  }
}
