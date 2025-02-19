import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/domain/entity/news_model.dart';

class NewsApi {
  static Future<List<NewsArticle>> fetchNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-06-30&sortBy=publishedAt&apiKey=717c867f93cc45cea5e1794bfc54d66f";
    final response = await http.get(Uri.parse(url));
    print(response.body.toString());
    if (response.statusCode == 200) {
      final List<dynamic> articlesJson = json.decode(response.body)['articles'];
      return articlesJson.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch news");
    }
  }
}
