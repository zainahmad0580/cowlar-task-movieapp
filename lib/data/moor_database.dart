import 'dart:convert';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:movieapp/model/movie_model.dart';

// Moor works by source gen. This file will contain all the generated code.
part 'moor_database.g.dart';

// Define a table for movies
class Movies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get backdropPath => text().nullable()();
  TextColumn get originalTitle => text().nullable()();
  TextColumn get overview => text().nullable()();
  RealColumn get popularity => real().nullable()();
  TextColumn get posterPath => text().nullable()();
  TextColumn get releaseDate => text().nullable()();
  TextColumn get originalLanguage => text().nullable()();
  BoolColumn get adult => boolean().nullable()();
  BoolColumn get video => boolean().nullable()();
  RealColumn get voteAverage => real().nullable()();
  IntColumn get voteCount => integer().nullable()();
  TextColumn get genreIds => text().nullable()(); // Store as JSON string
}

// Define the database class
@UseMoor(tables: [Movies])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;

  // Define a method to get the movies from the database
  Future<List<MovieModel>> getAllMovies() async {
    return select(movies)
        .map((row) => MovieModel(
              id: row.id,
              title: row.title,
              backdropPath: row.backdropPath,
              originalTitle: row.originalTitle,
              overview: row.overview,
              popularity: row.popularity,
              posterPath: row.posterPath,
              releaseDate: row.releaseDate,
              originalLanguage: row.originalLanguage,
              adult: row.adult,
              video: row.video,
              voteAverage: row.voteAverage,
              voteCount: row.voteCount,
              genreIds: row.genreIds != null
                  ? List<int>.from(json.decode(row.genreIds ?? ''))
                  : null,
            ))
        .get();
  }

  // Define a method to insert movies into the database
  Future<void> insertMovies(List<MovieModel> movies) async {
    batch((batch) {
      for (var movie in movies) {
        batch.insert(
            this.movies,
            MoviesCompanion(
              title: Value(movie.title!),
              backdropPath: Value(movie.backdropPath),
              originalTitle: Value(movie.originalTitle),
              overview: Value(movie.overview),
              popularity: Value(movie.popularity),
              posterPath: Value(movie.posterPath),
              releaseDate: Value(movie.releaseDate),
              originalLanguage: Value(movie.originalLanguage),
              adult: Value(movie.adult),
              video: Value(movie.video),
              voteAverage: Value(movie.voteAverage),
              voteCount: Value(movie.voteCount),
            ));
      }
    });
  }
}