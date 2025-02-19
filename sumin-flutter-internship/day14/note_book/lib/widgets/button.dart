import 'package:flutter/material.dart';
import 'package:note_book/config/colour.dart';
import 'package:note_book/config/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.08,
      width: screenWidth * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: buttoncolor, // Constant color
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: BottonText.style,
          // Constant color
        ),
      ),
    );
  }
}
