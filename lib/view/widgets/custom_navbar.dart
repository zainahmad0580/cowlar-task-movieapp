import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movieapp/provider/navbar_provider.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.03, horizontal: size.width * 0.05),
      decoration: const BoxDecoration(
        color: AppColors.navbar,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Consumer<NavBarProvider>(builder: (context, value, child) {
        return GNav(
            style: GnavStyle.oldSchool,
            selectedIndex: value.index!,
            onTabChange: (index) => value.changeIndex(index),
            padding: EdgeInsets.all(size.width * 0.01),
            color: AppColors.greyText,
            activeColor: AppColors.white,
            tabBackgroundColor: AppColors.navbar,
            tabs: const [
              GButton(text: 'Dashboard', icon: Icons.grid_view_rounded),
              GButton(text: 'Watch', icon: CupertinoIcons.play_rectangle_fill),
              GButton(text: 'Media Library', icon: Icons.photo_library_sharp),
              GButton(text: 'More', icon: CupertinoIcons.list_dash),
            ]);
      }),
    );
  }
}
