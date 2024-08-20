import 'dart:io';

import 'package:e_order/utility/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

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

  static Future<http.Response> postRequest({
    required String endpoint,
    required Map<String, dynamic> body,
    String? token,
    File? image,
  }) async {
    try {
      // final response = await http.post(
      //   Uri.parse(baseUrl + endpoint),
      //   headers: token != null
      //       ? {
      //           'Authorization': 'Bearer $token',
      //           'Accept': 'application/json',
      //           'Content-Type': 'application/x-www-form-urlencoded'
      //         }
      //       : {'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded'},
      //   body: body,
      // );

      final uri = Uri.parse(baseUrl + endpoint);

      var request = http.MultipartRequest('POST', uri);

      request.headers.addAll({
        if (token != null) 'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      });

      body.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      if (image != null) {
        var multipartFile = await http.MultipartFile.fromPath(
          'image',
          image.path,
          contentType: MediaType(
            'image',
            'jpeg',
          ),
        );
        request.files.add(multipartFile);

        // final multiPartFile = http.MultipartFile.fromBytes(
        //   'image',
        //   File(image.path).readAsBytesSync(),
        //   filename: image.path,
        // );
        //
        // request.files.add(
        //     // http.MultipartFile.fromBytes(
        //     //   'image',
        //     //   File(image.path).readAsBytesSync(),
        //     //   filename: image.path,
        //     // ),
        //     multiPartFile);
      }

      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
