import 'package:flutter/material.dart';
import 'package:localization/config/font_style.dart';

class TextBox extends StatefulWidget {
  const TextBox(
      {Key? key,
      required this.hintText,
      required this.textEditingController,
      required this.validator,
      this.showEyeIcon = false,
      required this.textInputAction,
      this.onEditingComplete})
      : super(key: key);

  final String hintText;
  final TextInputAction textInputAction;
  final VoidCallback? onEditingComplete;

  final TextEditingController? textEditingController;
  final FormFieldValidator<String> validator;
  final bool showEyeIcon;

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
      child: TextFormField(
        validator: widget.validator,
        textInputAction: widget.textInputAction,
        onEditingComplete: widget.onEditingComplete,
        autofocus: true,
        controller: widget.textEditingController,
        obscureText: widget.showEyeIcon ? _obscureText : false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          labelText: widget.hintText,
          hintStyle: HintText.style,
          suffixIcon: widget.showEyeIcon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                )
              : null,
        ),
      ),
    );
  }
}
