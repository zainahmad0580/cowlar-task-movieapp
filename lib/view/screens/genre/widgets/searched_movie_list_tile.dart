import 'package:flutter/material.dart';
import 'package:movieapp/api/api_endpoints.dart';
import 'package:movieapp/model/genre_model.dart';
import 'package:movieapp/provider/genre_provider.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/utils/styles.dart';
import 'package:provider/provider.dart';

class SearchedMovieListTile extends StatelessWidget {
  final String posterUrl;
  final String title;
  final List<int> genreIds;

  const SearchedMovieListTile(
      {super.key,
      required this.posterUrl,
      required this.title,
      required this.genreIds});

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
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:
                          NetworkImage(ApiEndpoints.storageUrlw500 + posterUrl),
                      onError: (exception, stackTrace) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover))),
          Expanded(
            child: ListTile(
              title: Text(title,
                  style: ThemeText.boldText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              subtitle: genreIds.isNotEmpty
                  ? Consumer<GenreProvider>(builder: (context, value, child) {
                      // Find the genre model where id matches with genreIds.first
                      final GenreModel genre = value.genres
                          .firstWhere((genre) => genre.id == genreIds.first);

                      return Text(genre.name ?? '',
                          style: ThemeText.subtitleTextGrey);
                    })
                  : null,
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
