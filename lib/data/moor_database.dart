import 'dart:convert';
import 'dart:developer';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:movieapp/model/genre_model.dart';
import 'package:movieapp/model/movie_model.dart';

// Moor works by source gen. This file will contain all the generated code.
part 'moor_database.g.dart';

// Define a table for movies
class Movies extends Table {
  IntColumn get id => integer()(); // Modify to remove autoIncrement
  TextColumn get title => text().nullable()();
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

  @override
  Set<Column> get primaryKey => {id}; // Set id as the primary key
}

// Define a table for genres
class Genres extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Define the database class
@UseMoor(tables: [Movies, Genres])
class AppDatabase extends _$AppDatabase {
  //ONLY 1 INSTANCE MUST BE USED TTHROUGH OUT THE APP TO AVOID MULTIPLE DATABASES BEING CREATED AND RACE CONDITIONS
  static final AppDatabase _instance = AppDatabase();

  static AppDatabase get instance => _instance;
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
    log('Getting all movies from local db');
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
                : null))
        .get();
  }

  // Define a method to insert movies into the database
  Future<void> insertMovies(List<MovieModel> movies) async {
    log('Inserting all movies into local db');
    batch((batch) {
      for (var movie in movies) {
        batch.insert(
            this.movies,
            MoviesCompanion(
                id: Value(movie.id!), // Assigning id at runtime
                title: Value(movie.title),
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
                voteCount: Value(movie.voteCount)),
            mode: InsertMode.insertOrReplace);
      }
    });
  }

  // Define a method to get the genres from the database
  Future<List<GenreModel>> getAllGenres() async {
    log('Getting all genres from local db');
    return select(genres)
        .map((row) => GenreModel(id: row.id, name: row.name))
        .get();
  }

  Future<void> insertGenres(List<GenreModel> genres) async {
    log('Inserting all genres into local db');
    batch((batch) {
      for (var genre in genres) {
        batch.insert(this.genres,
            GenresCompanion(id: Value(genre.id!), name: Value(genre.name)),
            mode: InsertMode.insertOrReplace);
      }
    });
  }
}
