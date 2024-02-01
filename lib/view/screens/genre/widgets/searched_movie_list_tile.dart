import 'package:flutter/material.dart';
import 'package:movieapp/utils/app_assets.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/utils/styles.dart';

class SearchedMovieListTile extends StatelessWidget {
  final String posterUrl;
  final String title;
  final String genre;

  const SearchedMovieListTile(
      {super.key,
      required this.posterUrl,
      required this.title,
      required this.genre});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
      child: Row(
        children: [
          Container(
              height: size.height * 0.15,
              width: size.width * 0.40,
              decoration: BoxDecoration(
                  color: AppColors.genrePink,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: const AssetImage(AppAssets.movie),
                      onError: (exception, stackTrace) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover))),
          Expanded(
            child: ListTile(
              title: Text(title, style: ThemeText.boldText),
              subtitle: Text(genre, style: ThemeText.subtitleTextGrey),
              trailing: Icon(
                Icons.more_horiz,
                color: AppColors.btn,
                size: size.width * 0.08,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
