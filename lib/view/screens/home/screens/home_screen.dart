import 'package:flutter/material.dart';
import 'package:movieapp/api/movie_api.dart';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/view/screens/home/widgets/home_title_bar.dart';
import 'package:movieapp/view/screens/movie/widgets/movie_card.dart';
import 'package:movieapp/view/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Column(children: [
        const HomeTitleBar(),
        const SearchField(),
        Center(
          child: FutureBuilder(
              future: MovieApi.getAllMovies(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(color: AppColors.btn);
                } else if (snapshot.hasError) {
                  return const Icon(Icons.error);
                } else {
                  List<MovieModel> movies = snapshot.data ?? [];

                  if (movies.isEmpty) {
                    return const Text('No movie found');
                  }
                  return ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: ((context, index) {
                        final movie = movies[index];
                        return MovieCard(movieModel: movie);
                      }));
                }
              }),
        )
      ])),
    ));
  }
}
