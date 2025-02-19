import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:note_book/config/colour.dart';
import 'package:note_book/config/theme.dart';

import 'package:note_book/widgets/app_bar.dart';
import 'package:note_book/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroudColor,
      appBar: CustomAppBar(
        leading: Image.asset("assets/images/burger.png"),
        title: "All Notes",
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("assets/images/homepage.png"),
        Gap(screenHeight * .04),
        const Text(
          "Create Your First Note",
          style: Heading1.style,
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * .14, vertical: screenHeight * .02),
          child: const Center(
            child: Text(
              "Add a note about anything (your thoughts on climate change, or your history essay) and share it witht the world.",
              style: BodyText.style,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Gap(screenHeight * .05),
        CustomButton(
          title: "Create A Note",
          onPressed: () => context.go('/recent'),
        )
      ])),
    );
  }
}
