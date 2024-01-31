import 'package:flutter/material.dart';
import 'package:movieapp/model/genre_model.dart';
import 'package:movieapp/utils/styles.dart';
import 'package:movieapp/view/screens/movie/widgets/genre_container.dart';

class Genres extends StatelessWidget {
  final List<GenreModel> genres;
  const Genres({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Genres', style: ThemeText.boldText),
        SizedBox(height: size.height * 0.01),
        Wrap(
            spacing: size.width * 0.02,
            runSpacing: size.height * 0.02,
            children: genres
                .map((genre) => GenreContainer(genreTitle: genre.name!))
                .toList())
      ],
    );
  }
}
