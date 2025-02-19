import 'package:flutter/material.dart';
import 'package:news_app/domain/entity/news_model.dart';
import 'package:news_app/presentation/widgets/detail_content.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.newsArticle,
  });

  final NewsArticle newsArticle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header image
          Container(
            height: 200.0,
            width: double.infinity,
            child: Image.network(
              newsArticle.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          // Content section
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DetailContent(
                  newsArticle: newsArticle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
