import 'dart:convert';
import 'dart:io';

import 'package:e_order/data/models/catalog_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

  Future<CatalogModel> postCatalog(
    String catalogName,
    File image,
  ) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    final String? token = sf.getString("token");
    try {
      final response = await DataProvider.postRequest(
        endpoint: "/catalogs/store",
        body: {
          'name': catalogName,
          'image': image,
        },
        token: token!,
      );

      if (response.statusCode == 200) {
        CatalogModel catalogs = CatalogModel.fromJson(jsonDecode(response.body));
        return catalogs;
      } else {
        throw "Error while posting catalogs.";
      }
    } catch (_) {
      rethrow;
    }
  }

  final catalogBox = Hive.box("catalog_box");
  Future<void> saveCatalogLocally({required CatalogModel catalog}) async {
    await catalogBox.add(catalog);
  }

  Future<List<dynamic>> fetchAllLocalCatalog() async {
    final localCatalog = catalogBox.values.toList();
    return localCatalog;
  }
}
