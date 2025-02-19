import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/size_constant.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/presentation/journey/about/about_page.dart';
import 'package:movie_app/presentation/journey/drawer/drawer_navigation_list_item.dart';
import 'package:movie_app/presentation/journey/favourite/favourite_screen.dart';
import 'package:movie_app/presentation/widgets/logo_widgets.dart';

class CustopmNavigationDrawer extends StatelessWidget {
  const CustopmNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
        color: Theme.of(context).primaryColor.withOpacity(0),
      ),
      width: MediaQuery.of(context).size.width * .6,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * .03,
                  left: screenWidth * .05,
                  right: screenHeight * .05,
                  bottom: screenHeight * .03),
              child: LogoWidgets(height: Sizes.dimen_32.h),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FavouriteScreenone()));
              },
              child: const DrawerNavigationListItem(
                title: 'Favourite Movies',
              ),
            ),
            GestureDetector(
              onTap: () => Wiredash.of(context).show(),
              child: const DrawerNavigationListItem(
                title: 'FeedBack',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AboutPage()));
              },
              child: const DrawerNavigationListItem(
                title: 'About',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
