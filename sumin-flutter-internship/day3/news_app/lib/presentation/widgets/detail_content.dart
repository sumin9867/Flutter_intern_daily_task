import 'package:flutter/material.dart';
import 'package:news_app/config/colour.dart';
import 'package:news_app/config/theme.dart';
import 'package:news_app/domain/entity/news_model.dart';

class DetailContent extends StatefulWidget {
  const DetailContent({super.key, required this.newsArticle});

  final NewsArticle newsArticle;

  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: backgroudColor,
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.03,
        horizontal: screenWidth * .06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.newsArticle.title,
            style: HeadlineDetail.style,
          ),
          const SizedBox(height: 7),
          Text(
            widget.newsArticle.date,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: screenHeight * 0.50,
            child: Text(
              widget.newsArticle.content,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 21 / 14,
                fontFamily: 'Poppins',
              ),
              maxLines: isExpanded ? null : 4,
              overflow:
                  isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: screenWidth * .9,
            height: screenHeight * .058,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                isExpanded ? 'Read Less' : 'Read More',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
