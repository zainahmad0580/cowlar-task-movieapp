import 'package:flutter/material.dart';
import 'package:movieapp/model/genre_model.dart';
import 'package:movieapp/utils/styles.dart';

class GenreCard extends StatelessWidget {
  final GenreModel genreModel;
  const GenreCard({super.key, required this.genreModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding:
          EdgeInsets.only(left: size.width * 0.03, bottom: size.width * 0.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: const AssetImage('assets/images/movie.png'),
              onError: (exception, stackTrace) => const Icon(Icons.error),
              fit: BoxFit.cover)),
      child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            genreModel.name!,
            style: ThemeText.appBarWhite,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )),
    );
  }
}
