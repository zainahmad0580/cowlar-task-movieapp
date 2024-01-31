import 'package:flutter/material.dart';
import 'package:movieapp/api/api_endpoints.dart';
import 'package:movieapp/model/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movieModel;
  const MovieCard({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(
                ApiEndpoints.storageUrlw500 + movieModel.backdropPath!),
            onError: (exception, stackTrace) => const Icon(Icons.error),
          )),
      child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(movieModel.originalTitle!)),
    );
  }
}
