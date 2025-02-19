import 'dart:convert';

import 'package:http/http.dart';
import 'package:photo_labs/data_layer/core/api_constant.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  Future<dynamic> get(String path, {Map<String, dynamic>? params}) async {
    final response = await _client.get(
      getPath(path, params ?? {}),
      headers: {
        'Authorization': 'Client-ID ${ApiConstants.API_KEY}',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath(String path, Map<String, dynamic> params) {
    var paramsString = '';
    if (params.isNotEmpty) {
      params.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }
    return Uri.parse('${ApiConstants.BASE_URL}$path?$paramsString');
  }
}
