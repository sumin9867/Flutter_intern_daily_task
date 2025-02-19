import 'package:flutter/material.dart';
import 'package:news_app/domain/entity/news_model.dart';
import 'package:news_app/presentation/widgets/news_tile.dart';

class NewsList extends StatelessWidget {
  final Future<List<NewsArticle>> _newsFuture;

  const NewsList({Key? key, required Future<List<NewsArticle>> newsFuture})
      : _newsFuture = newsFuture,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsArticle>>(
      future: _newsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        } else if (snapshot.hasData) {
          final List<NewsArticle> newsArticles = snapshot.data!;
          if (newsArticles.isEmpty) {
            return const Center(child: Text("No Data Available"));
          }
          // Use a Container with a specific height or constraints if needed
          return Container(
            height: MediaQuery.of(context).size.height *
                0.6, // Adjust height as needed
            child: ListView.builder(
              itemCount: newsArticles.length,
              itemBuilder: (context, index) {
                final NewsArticle article = newsArticles[index];
                return NewsTile(article: article);
              },
            ),
          );
        } else {
          return const Center(child: Text("No Data Available"));
        }
      },
    );
  }
}
