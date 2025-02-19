import 'dart:convert';

import 'package:tryapi/data/model/estore_product_model.dart';
import 'package:tryapi/data/reposiatory/remote_data.dart';
import 'package:http/http.dart' as http;

class RemoteDataImpl extends RemoteData {
  @override
  Future<List<EstoreProductModel>> getData() async {
    final response =
        await http.get(Uri.parse("https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      final List<dynamic> result = json.decode(response.body)['products'];

      return result.map((e) => EstoreProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}
