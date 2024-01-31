import 'package:flutter/material.dart';
import 'package:movieapp/api/movie_api.dart';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/view/screens/home/widgets/home_app_bar.dart';
import 'package:movieapp/view/screens/movie/widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const HomeAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.03),
          child: Column(children: [
            FutureBuilder(
                future: MovieApi.getAllMovies(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        child: const CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Icon(Icons.error);
                  } else {
                    List<MovieModel> movies = snapshot.data ?? [];

                    if (movies.isEmpty) {
                      return const Text('No movie found');
                    }

                    return Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.length,
                          itemBuilder: ((context, index) {
                            final movie = movies[index];
                            return MovieCard(movieModel: movie);
                          })),
                    );
                  }
                })
          ]),
        ));
  }
}
