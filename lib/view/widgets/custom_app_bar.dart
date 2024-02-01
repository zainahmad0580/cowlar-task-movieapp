import 'package:flutter/material.dart';
import 'package:movieapp/utils/styles.dart';

import '../../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isForegroundWhite;
  final String title;
  const CustomAppBar(
      {super.key, required this.title, this.isForegroundWhite = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios,
                color: isForegroundWhite ? AppColors.white : AppColors.black)),
        title: Text(title,
            style: isForegroundWhite
                ? ThemeText.appBarWhite
                : ThemeText.appBarBlack));
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
