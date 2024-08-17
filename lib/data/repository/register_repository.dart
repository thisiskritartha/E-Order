import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/register_model.dart';
import '../provider/data_provider.dart';

class RegisterRepository {
  DataProvider dataProvider = DataProvider();

  Future<RegisterModel> register({
    required String email,
    required String password,
    required String phone,
    required String fullName,
    required String country,
    required String city,
  }) async {
    try {
      final response = await DataProvider.postRequest(endpoint: "/customers/signup", body: {
        'email': email,
        'password': password,
        'phone': phone,
        'name': fullName,
        'country': country,
        'city': city,
      });

      if (response.statusCode == 200) {
        RegisterModel user = RegisterModel.fromJson(jsonDecode(response.body));

        final String? _token = user.data?.token;
        final String? _name = user.data?.customerToken?.name;

        SharedPreferences sf = await SharedPreferences.getInstance();
        await sf.setString("token", _token!);
        await sf.setString("name", _name!);

        return user;
      } else {
        throw "Error while log in.";
      }
    } catch (_) {
      rethrow;
    }
  }
}
