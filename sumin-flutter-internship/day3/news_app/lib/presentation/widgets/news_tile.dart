import 'package:flutter/material.dart';
import 'package:news_app/presentation/journey/detail_page.dart';
import 'package:news_app/domain/entity/news_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.article});
  final NewsArticle article;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              newsArticle: article,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.07,
          top: screenHeight * .02,
        ),
        child: SizedBox(
          height: screenHeight * 0.09,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  article.imageUrl!,
                  fit: BoxFit.cover,
                  width: screenWidth * .3,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // Image is fully loaded, return the image widget
                    } else {
                      return const Center(
                        heightFactor: 2,
                        widthFactor: 2,
                        child: CircularProgressIndicator(),
                      ); // Show a loading indicator while the image is loading
                    }
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return const Center(
                      child: Icon(Icons.error),
                    ); // Display an error icon if the image fails to load
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    article.title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
