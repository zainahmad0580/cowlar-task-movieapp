import 'package:flutter/material.dart';
import 'package:movieapp/utils/styles.dart';

import '../../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.bg,
            )),
        title: Text(title, style: ThemeText.appBarWhite));
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
