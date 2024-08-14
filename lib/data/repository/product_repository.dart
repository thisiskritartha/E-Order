import 'dart:convert';

import 'package:e_order/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/data_provider.dart';

class ProductRepository {
  DataProvider dataProvider = DataProvider();

  Future<ProductModel> getProducts(String id) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    final String? token = sf.getString("token");
    try {
      final response = await DataProvider.getRequest(
        endpoint: "https://eorder-be.palika.site/api/catalogs/products/$id",
        token: token!,
      );

      if (response.statusCode == 200) {
        ProductModel products = ProductModel.fromJson(jsonDecode(response.body));
        return products;
      } else {
        throw "Error while fetching products.";
      }
    } catch (_) {
      rethrow;
    }
  }
}
