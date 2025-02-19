class NewsArticle {
  final String title;
  final String description;
  final String? imageUrl;
  final String date;
  final String content;

  NewsArticle({
    required this.date,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      content: json['content'] ?? '',
      date: json['date'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
    );
  }
}
