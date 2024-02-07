import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/provider/movie_provider.dart';
import 'package:movieapp/view/screens/movie/widgets/movie_card.dart';
import 'package:movieapp/view/widgets/shimmer_card_effect.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    var size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async => await movieProvider.setMovies(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: FutureBuilder(
            future: movieProvider.setMovies(),
            builder: (context, snapshot) {
              log('Inside future builder');
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ShimmerCardEffect(
                    items: 4,
                    height: size.height * 0.25,
                    width: size.width * 0.9);
              } else if (snapshot.hasError) {
                return const Icon(Icons.error);
              } else {
                return Consumer<MovieProvider>(
                    builder: (context, value, child) {
                  List<MovieModel> movies = value.movies;

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
                });
              }
            }),
      ),
    );
  }
}
