import 'package:flutter/material.dart';
import 'package:movieapp/api/movie_api.dart';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/provider/navbar_provider.dart';
import 'package:movieapp/view/screens/dashboard/dashboard_screen.dart';
import 'package:movieapp/view/screens/home/widgets/home_app_bar.dart';
import 'package:movieapp/view/screens/media_library/media_library_screen.dart';
import 'package:movieapp/view/screens/more/more_screen.dart';
import 'package:movieapp/view/screens/movie/widgets/movie_card.dart';
import 'package:movieapp/view/widgets/custom_navbar.dart';
import 'package:movieapp/view/widgets/shimmer_card_effect.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: const CustomNavBar(),
        appBar: const HomeAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.03),
          child: Consumer<NavBarProvider>(builder: (context, value, child) {
            return IndexedStack(index: value.index, children: [
              const DashboardScreen(),
              Column(children: [
                Expanded(
                  child: FutureBuilder(
                      future: MovieApi.getAllMovies(context),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                      }),
                )
              ]),
              const MediaLibraryScreen(),
              const MoreScreen()
            ]);
          }),
        ));
  }
}
