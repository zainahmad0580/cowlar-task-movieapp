import 'package:flutter/material.dart';
import 'package:movieapp/api/movie_api.dart';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/view/screens/movie/widgets/movie_card.dart';
import 'package:movieapp/view/widgets/shimmer_card_effect.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async => await MovieApi.getAllMovies(),
      child: ListView(children: [
        FutureBuilder(
            future: MovieApi.getAllMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ShimmerCardEffect(
                    items: 4,
                    height: size.height * 0.25,
                    width: size.width * 0.9);
              } else if (snapshot.hasError) {
                return const Icon(Icons.error);
              } else {
                List<MovieModel> movies = snapshot.data ?? [];

                if (movies.isEmpty) {
                  return const Text('No movie found');
                }

                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: movies.length,
                    itemBuilder: ((context, index) {
                      final movie = movies[index];
                      return MovieCard(movieModel: movie);
                    }));
              }
            })
      ]),
    );
  }
}
