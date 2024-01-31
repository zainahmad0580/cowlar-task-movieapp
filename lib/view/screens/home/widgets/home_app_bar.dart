import 'package:flutter/material.dart';
import 'package:movieapp/routes/route_names.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/utils/styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Watch', style: ThemeText.appBarBlack),
      backgroundColor: AppColors.bg,
      foregroundColor: AppColors.black,
      actions: [
        IconButton(
            onPressed: () => Navigator.pushNamed(context, RouteNames.genreList),
            icon: const Icon(Icons.search))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
