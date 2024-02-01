import 'package:flutter/material.dart';
import 'package:movieapp/routes/route_names.dart';
import 'package:movieapp/view/screens/home/screens/home_screen.dart';
import 'package:movieapp/view/screens/genre/screens/genre_list_screen.dart';
import 'package:movieapp/view/screens/movie/screens/movie_detail_screen.dart';
import 'package:movieapp/view/screens/movie/screens/movie_list_screen.dart';
import 'package:movieapp/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteNames.movieList:
        return MaterialPageRoute(builder: (_) => const MovieListScreen());
      case RouteNames.movieDetail:
        return MaterialPageRoute(
            builder: (_) => MovieDetailScreen(movieId: args as int));
      case RouteNames.genreList:
        return MaterialPageRoute(builder: (_) => const GenreListScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
