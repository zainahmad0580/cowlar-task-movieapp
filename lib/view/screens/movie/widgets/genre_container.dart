import 'package:flutter/material.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/utils/constants.dart';
import 'package:movieapp/utils/styles.dart';

class GenreContainer extends StatelessWidget {
  final String genreTitle;
  const GenreContainer({super.key, required this.genreTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: genreColors[genreTitle] ??
              AppColors.genreTeal, //default color if title does not match
          borderRadius: BorderRadius.circular(40)),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Text(
        genreTitle,
        style: ThemeText.smallBtn,
      ),
    );
  }
}
