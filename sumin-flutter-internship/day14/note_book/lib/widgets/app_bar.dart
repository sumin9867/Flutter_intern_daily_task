import 'package:flutter/material.dart';
import 'package:note_book/config/colour.dart';
import 'package:note_book/config/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget leading;
  final Widget? trailer;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.leading,
    this.trailer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroudColor,
      title: Text(
        title,
        style: AppBarHEading.style,
        textAlign: TextAlign.center,
      ),
      leading: leading,
      actions: trailer != null ? [trailer!] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
