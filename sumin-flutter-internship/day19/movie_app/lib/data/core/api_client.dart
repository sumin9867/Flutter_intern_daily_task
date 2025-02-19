import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_constant.dart';

class ApiClient {
  final Client _client;
  ApiClient(
    this._client,
  );
  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.get(
      getPath(path, params ?? {}),

      // Uri.parse(
      //     '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}&page=2'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

Uri getPath(String path, Map<dynamic, dynamic> params) {
  var paramsString = '';
  if (params.isNotEmpty) {
    params.forEach((key, value) {
      paramsString += '&$key=$value';
    });
  }
  return Uri.parse(
      '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}&page=5$paramsString');
}
