import 'package:flutter/material.dart';
import 'package:movieapp/provider/search_provider.dart';
import 'package:movieapp/utils/styles.dart';
import 'package:movieapp/view/screens/genre/widgets/searched_movie_list_tile.dart';
import 'package:provider/provider.dart';

class SearchedMovies extends StatelessWidget {
  final bool showListOnly;
  const SearchedMovies({super.key, this.showListOnly = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!showListOnly) ...[
          const Text('Top Results', style: ThemeText.blacktext16),
          const Divider(),
        ],
        Expanded(
          child: Consumer<SearchProvider>(
            builder: (context, searchProvider, child) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchProvider.searchedMovies.length,
                  itemBuilder: (context, index) {
                    final searchedMovie = searchProvider.searchedMovies[index];

                    return SearchedMovieListTile(
                        posterUrl: searchedMovie.backdropPath!,
                        title: searchedMovie.title!,
                        genreIds: searchedMovie.genreIds!);
                  });
            },
          ),
        )
      ],
    );
  }
}
