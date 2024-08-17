import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../provider/data_provider.dart';

class LoginRepository {
  DataProvider dataProvider = DataProvider();

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await DataProvider.postRequest(endpoint: "/customers/login", body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(response.body));

        final String? _token = user.data?.customerToken;
        final String? _name = user.data?.customer?.name;

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
