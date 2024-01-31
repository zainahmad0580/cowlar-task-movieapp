import 'package:flutter/material.dart';
import 'package:movieapp/api/api_endpoints.dart';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/routes/route_names.dart';
import 'package:movieapp/utils/styles.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movieModel;
  const MovieCard({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RouteNames.movieDetail,
          arguments: movieModel),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
        padding:
            EdgeInsets.only(left: size.width * 0.07, bottom: size.width * 0.05),
        height: size.height * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(
                    ApiEndpoints.storageUrlw500 + movieModel.posterPath!),
                onError: (exception, stackTrace) => const Icon(Icons.error),
                fit: BoxFit.cover)),
        child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              movieModel.originalTitle!,
              style: ThemeText.headingText,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )),
      ),
    );
  }
}
