import 'dart:convert';

import 'package:e_order/data/models/catalog_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/data_provider.dart';

class CatalogRepository {
  DataProvider dataProvider = DataProvider();

  Future<CatalogModel> getCatalog() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    final String? token = sf.getString("token");
    try {
      final response = await DataProvider.getRequest(
        endpoint: "/catalogs",
        token: token!,
      );

      if (response.statusCode == 200) {
        CatalogModel catalogs = CatalogModel.fromJson(jsonDecode(response.body));
        return catalogs;
      } else {
        throw "Error while fetching catalogs.";
      }
    } catch (_) {
      rethrow;
    }
  }
}
