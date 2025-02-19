import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_labs/presentation_layer/theme/screen_size.dart';
import 'package:photo_labs/presentation_layer/theme/theme_text.dart';
import 'package:photo_labs/presentation_layer/widgets/navigation_Screen.dart';

class SplashWidgets extends StatelessWidget {
  const SplashWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
              child: Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Positioned(
            bottom: ScreenSize.getScreenHeight(context) * .25,
            left: ScreenSize.getScreenWidth(context) * .06,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.getScreenWidth(context) * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore your Capture.",
                    style: SplashBigText.style.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenSize.getScreenHeight(context) * .04,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Share your capture with Photo Gallery",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 184, 184, 184),
                        fontSize: ScreenSize.getScreenHeight(context) * .021,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: ScreenSize.getScreenHeight(context) * .1,
            left: ScreenSize.getScreenWidth(context) * .2,
            child: GestureDetector(
              // onTap: () => Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const AppNAvigationaBar()),
              // ),
              onTap: () {
                context.goNamed('bottomnavigation');
              },
              child: Container(
                width: ScreenSize.getScreenWidth(context) * .6,
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.getScreenWidth(context) * .07,
                    vertical: ScreenSize.getScreenHeight(context) * .035),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
