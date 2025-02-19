import 'package:flutter/material.dart';
import 'package:localization/config/colour.dart';
import 'package:localization/config/font_style.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key, required this.buttonText, this.onTap})
      : super(key: key);
  final String buttonText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenHeight * .45,
      height: 58,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: ButtonText.style,
          ),
        ),
      ),
    );
  }
}
