// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DrawerNavigationListItem extends StatelessWidget {
  final String title;

  const DrawerNavigationListItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final screemWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screemWidth * .04),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.7),
                blurRadius: 0.7)
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
