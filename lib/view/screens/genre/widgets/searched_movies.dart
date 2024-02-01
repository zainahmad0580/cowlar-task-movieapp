import 'package:flutter/material.dart';
import 'package:movieapp/provider/genre_provider.dart';
import 'package:movieapp/provider/search_provider.dart';
import 'package:movieapp/utils/styles.dart';
import 'package:movieapp/view/screens/genre/widgets/searched_movie_list_tile.dart';
import 'package:provider/provider.dart';

class SearchedMovies extends StatelessWidget {
  const SearchedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Top Results', style: ThemeText.blacktext16),
        const Divider(),
        Expanded(
          child: Consumer2<SearchProvider, GenreProvider>(
            builder: (context, searchProvider, genreProvider, child) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  //itemCount: searchProvider.searchedMovies.length,
                  itemBuilder: (context, index) {
                    return SearchedMovieListTile(
                        posterUrl: '', title: 'Time', genre: 'Hi');
                  });
            },
          ),
        )
      ],
    );
  }
}
