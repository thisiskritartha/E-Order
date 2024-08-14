import 'package:e_order/utility/constants.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  static Future<http.Response> getRequest({required String endpoint, required String token}) async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl + endpoint),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<http.Response> postRequest(
      {required String endpoint, required Map<String, dynamic> body}) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + endpoint),
        headers: {'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded'},
        body: body,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
