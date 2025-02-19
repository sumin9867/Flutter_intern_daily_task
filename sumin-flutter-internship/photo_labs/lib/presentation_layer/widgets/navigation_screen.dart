import 'package:flutter/material.dart';
import 'package:photo_labs/presentation_layer/screen/homepage.dart';
import 'package:photo_labs/presentation_layer/screen/photo_detail/favourite_screen.dart';
import 'package:photo_labs/presentation_layer/screen/random_image_screen/random_image_widgets.dart';

import 'package:photo_labs/presentation_layer/theme/screen_size.dart';

class AppNAvigationaBar extends StatefulWidget {
  const AppNAvigationaBar({Key? key}) : super(key: key);

  @override
  State<AppNAvigationaBar> createState() => _AppNAvigationaBarState();
}

class _AppNAvigationaBarState extends State<AppNAvigationaBar> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _currentPageIndex,
            children: const [
              HomePage(),
              RandomImageWidget(),
              FavouriteScreen()
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: ScreenSize.getScreenHeight(context) * .01),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(0, Icons.home_outlined),
          _buildBottomNavItem(1, Icons.photo_camera_outlined),
          _buildBottomNavItem(2, Icons.favorite_border),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(int index, IconData iconData) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentPageIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _currentPageIndex == index
              ? const Color.fromARGB(255, 8, 43, 246)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          iconData,
          color: _currentPageIndex == index
              ? const Color.fromARGB(255, 252, 252, 252)
              : const Color.fromARGB(255, 0, 0, 0),
          size: 30,
        ),
      ),
    );
  }
}
