import 'package:flutter/material.dart';
import 'package:movie_app/presentation/theme/theme_text.dart';
import 'package:movie_app/presentation/widgets/appbar_widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: const Column(
              children: <Widget>[
                MovieAppBar(),
                Text('Welcome to Movie App', style: HeadlineText.style),
                SizedBox(height: 20.0),
                Text(
                    'Lights, camera, action! Here at Movie App, we\'re passionate about all things film. Whether you\'re a casual moviegoer or a dedicated cinephile, we\'ve got something for everyone.',
                    textAlign: TextAlign.center,
                    style: Body1.style),
                SizedBox(height: 20.0),
                Text(
                    'Our mission is simple: to bring the magic of the silver screen to your fingertips. From the latest Hollywood blockbusters to hidden indie gems, we\'re your go-to destination for all things cinema.',
                    textAlign: TextAlign.center,
                    style: Body2.style),
                SizedBox(height: 20.0),
                Text(
                    'But Movie App is more than just a place to watch trailers and read reviews. It\'s a community of fellow movie lovers, coming together to share their passion for film. Join us as we explore the rich tapestry of cinema, discuss our favorite films, and discover new classics together.',
                    textAlign: TextAlign.center,
                    style: Body2.style),
                SizedBox(height: 20.0),
                Text(
                    'So grab your popcorn, find your favorite seat, and let the show begin! Thank you for choosing Movie App – where every movie night is a blockbuster event.',
                    textAlign: TextAlign.center,
                    style: Body2.style),
                SizedBox(height: 20.0),
                Text(
                  'Lights out, and enjoy the show!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
