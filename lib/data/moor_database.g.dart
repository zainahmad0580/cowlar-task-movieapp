// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Movie extends DataClass implements Insertable<Movie> {
  final int id;
  final String? title;
  final String? backdropPath;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? originalLanguage;
  final bool? adult;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final String? genreIds;
  Movie(
      {required this.id,
      this.title,
      this.backdropPath,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.originalLanguage,
      this.adult,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.genreIds});
  factory Movie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Movie(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      backdropPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop_path']),
      originalTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}original_title']),
      overview: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}overview']),
      popularity: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}popularity']),
      posterPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path']),
      releaseDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date']),
      originalLanguage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}original_language']),
      adult: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}adult']),
      video: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}video']),
      voteAverage: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average']),
      voteCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_count']),
      genreIds: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}genre_ids']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String?>(backdropPath);
    }
    if (!nullToAbsent || originalTitle != null) {
      map['original_title'] = Variable<String?>(originalTitle);
    }
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String?>(overview);
    }
    if (!nullToAbsent || popularity != null) {
      map['popularity'] = Variable<double?>(popularity);
    }
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String?>(posterPath);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<String?>(releaseDate);
    }
    if (!nullToAbsent || originalLanguage != null) {
      map['original_language'] = Variable<String?>(originalLanguage);
    }
    if (!nullToAbsent || adult != null) {
      map['adult'] = Variable<bool?>(adult);
    }
    if (!nullToAbsent || video != null) {
      map['video'] = Variable<bool?>(video);
    }
    if (!nullToAbsent || voteAverage != null) {
      map['vote_average'] = Variable<double?>(voteAverage);
    }
    if (!nullToAbsent || voteCount != null) {
      map['vote_count'] = Variable<int?>(voteCount);
    }
    if (!nullToAbsent || genreIds != null) {
      map['genre_ids'] = Variable<String?>(genreIds);
    }
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      originalTitle: originalTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(originalTitle),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      popularity: popularity == null && nullToAbsent
          ? const Value.absent()
          : Value(popularity),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      originalLanguage: originalLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(originalLanguage),
      adult:
          adult == null && nullToAbsent ? const Value.absent() : Value(adult),
      video:
          video == null && nullToAbsent ? const Value.absent() : Value(video),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
      genreIds: genreIds == null && nullToAbsent
          ? const Value.absent()
          : Value(genreIds),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Movie(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      originalTitle: serializer.fromJson<String?>(json['originalTitle']),
      overview: serializer.fromJson<String?>(json['overview']),
      popularity: serializer.fromJson<double?>(json['popularity']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      releaseDate: serializer.fromJson<String?>(json['releaseDate']),
      originalLanguage: serializer.fromJson<String?>(json['originalLanguage']),
      adult: serializer.fromJson<bool?>(json['adult']),
      video: serializer.fromJson<bool?>(json['video']),
      voteAverage: serializer.fromJson<double?>(json['voteAverage']),
      voteCount: serializer.fromJson<int?>(json['voteCount']),
      genreIds: serializer.fromJson<String?>(json['genreIds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'originalTitle': serializer.toJson<String?>(originalTitle),
      'overview': serializer.toJson<String?>(overview),
      'popularity': serializer.toJson<double?>(popularity),
      'posterPath': serializer.toJson<String?>(posterPath),
      'releaseDate': serializer.toJson<String?>(releaseDate),
      'originalLanguage': serializer.toJson<String?>(originalLanguage),
      'adult': serializer.toJson<bool?>(adult),
      'video': serializer.toJson<bool?>(video),
      'voteAverage': serializer.toJson<double?>(voteAverage),
      'voteCount': serializer.toJson<int?>(voteCount),
      'genreIds': serializer.toJson<String?>(genreIds),
    };
  }

  Movie copyWith(
          {int? id,
          String? title,
          String? backdropPath,
          String? originalTitle,
          String? overview,
          double? popularity,
          String? posterPath,
          String? releaseDate,
          String? originalLanguage,
          bool? adult,
          bool? video,
          double? voteAverage,
          int? voteCount,
          String? genreIds}) =>
      Movie(
        id: id ?? this.id,
        title: title ?? this.title,
        backdropPath: backdropPath ?? this.backdropPath,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        adult: adult ?? this.adult,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
        genreIds: genreIds ?? this.genreIds,
      );
  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('popularity: $popularity, ')
          ..write('posterPath: $posterPath, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('adult: $adult, ')
          ..write('video: $video, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount, ')
          ..write('genreIds: $genreIds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      backdropPath,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      originalLanguage,
      adult,
      video,
      voteAverage,
      voteCount,
      genreIds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movie &&
          other.id == this.id &&
          other.title == this.title &&
          other.backdropPath == this.backdropPath &&
          other.originalTitle == this.originalTitle &&
          other.overview == this.overview &&
          other.popularity == this.popularity &&
          other.posterPath == this.posterPath &&
          other.releaseDate == this.releaseDate &&
          other.originalLanguage == this.originalLanguage &&
          other.adult == this.adult &&
          other.video == this.video &&
          other.voteAverage == this.voteAverage &&
          other.voteCount == this.voteCount &&
          other.genreIds == this.genreIds);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<int> id;
  final Value<String?> title;
  final Value<String?> backdropPath;
  final Value<String?> originalTitle;
  final Value<String?> overview;
  final Value<double?> popularity;
  final Value<String?> posterPath;
  final Value<String?> releaseDate;
  final Value<String?> originalLanguage;
  final Value<bool?> adult;
  final Value<bool?> video;
  final Value<double?> voteAverage;
  final Value<int?> voteCount;
  final Value<String?> genreIds;
  const MoviesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.overview = const Value.absent(),
    this.popularity = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.adult = const Value.absent(),
    this.video = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.genreIds = const Value.absent(),
  });
  MoviesCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.overview = const Value.absent(),
    this.popularity = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.adult = const Value.absent(),
    this.video = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.genreIds = const Value.absent(),
  });
  static Insertable<Movie> custom({
    Expression<int>? id,
    Expression<String?>? title,
    Expression<String?>? backdropPath,
    Expression<String?>? originalTitle,
    Expression<String?>? overview,
    Expression<double?>? popularity,
    Expression<String?>? posterPath,
    Expression<String?>? releaseDate,
    Expression<String?>? originalLanguage,
    Expression<bool?>? adult,
    Expression<bool?>? video,
    Expression<double?>? voteAverage,
    Expression<int?>? voteCount,
    Expression<String?>? genreIds,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (originalTitle != null) 'original_title': originalTitle,
      if (overview != null) 'overview': overview,
      if (popularity != null) 'popularity': popularity,
      if (posterPath != null) 'poster_path': posterPath,
      if (releaseDate != null) 'release_date': releaseDate,
      if (originalLanguage != null) 'original_language': originalLanguage,
      if (adult != null) 'adult': adult,
      if (video != null) 'video': video,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (voteCount != null) 'vote_count': voteCount,
      if (genreIds != null) 'genre_ids': genreIds,
    });
  }

  MoviesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? title,
      Value<String?>? backdropPath,
      Value<String?>? originalTitle,
      Value<String?>? overview,
      Value<double?>? popularity,
      Value<String?>? posterPath,
      Value<String?>? releaseDate,
      Value<String?>? originalLanguage,
      Value<bool?>? adult,
      Value<bool?>? video,
      Value<double?>? voteAverage,
      Value<int?>? voteCount,
      Value<String?>? genreIds}) {
    return MoviesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      backdropPath: backdropPath ?? this.backdropPath,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      adult: adult ?? this.adult,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      genreIds: genreIds ?? this.genreIds,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String?>(backdropPath.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String?>(originalTitle.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String?>(overview.value);
    }
    if (popularity.present) {
      map['popularity'] = Variable<double?>(popularity.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String?>(posterPath.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String?>(releaseDate.value);
    }
    if (originalLanguage.present) {
      map['original_language'] = Variable<String?>(originalLanguage.value);
    }
    if (adult.present) {
      map['adult'] = Variable<bool?>(adult.value);
    }
    if (video.present) {
      map['video'] = Variable<bool?>(video.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double?>(voteAverage.value);
    }
    if (voteCount.present) {
      map['vote_count'] = Variable<int?>(voteCount.value);
    }
    if (genreIds.present) {
      map['genre_ids'] = Variable<String?>(genreIds.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('popularity: $popularity, ')
          ..write('posterPath: $posterPath, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('adult: $adult, ')
          ..write('video: $video, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount, ')
          ..write('genreIds: $genreIds')
          ..write(')'))
        .toString();
  }
}

class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String?> backdropPath = GeneratedColumn<String?>(
      'backdrop_path', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  @override
  late final GeneratedColumn<String?> originalTitle = GeneratedColumn<String?>(
      'original_title', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String?> overview = GeneratedColumn<String?>(
      'overview', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _popularityMeta = const VerificationMeta('popularity');
  @override
  late final GeneratedColumn<double?> popularity = GeneratedColumn<double?>(
      'popularity', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String?> posterPath = GeneratedColumn<String?>(
      'poster_path', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String?> releaseDate = GeneratedColumn<String?>(
      'release_date', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _originalLanguageMeta =
      const VerificationMeta('originalLanguage');
  @override
  late final GeneratedColumn<String?> originalLanguage =
      GeneratedColumn<String?>('original_language', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _adultMeta = const VerificationMeta('adult');
  @override
  late final GeneratedColumn<bool?> adult = GeneratedColumn<bool?>(
      'adult', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (adult IN (0, 1))');
  final VerificationMeta _videoMeta = const VerificationMeta('video');
  @override
  late final GeneratedColumn<bool?> video = GeneratedColumn<bool?>(
      'video', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (video IN (0, 1))');
  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double?> voteAverage = GeneratedColumn<double?>(
      'vote_average', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  @override
  late final GeneratedColumn<int?> voteCount = GeneratedColumn<int?>(
      'vote_count', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _genreIdsMeta = const VerificationMeta('genreIds');
  @override
  late final GeneratedColumn<String?> genreIds = GeneratedColumn<String?>(
      'genre_ids', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        backdropPath,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        originalLanguage,
        adult,
        video,
        voteAverage,
        voteCount,
        genreIds
      ];
  @override
  String get aliasedName => _alias ?? 'movies';
  @override
  String get actualTableName => 'movies';
  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    }
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    }
    if (data.containsKey('popularity')) {
      context.handle(
          _popularityMeta,
          popularity.isAcceptableOrUnknown(
              data['popularity']!, _popularityMeta));
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    if (data.containsKey('original_language')) {
      context.handle(
          _originalLanguageMeta,
          originalLanguage.isAcceptableOrUnknown(
              data['original_language']!, _originalLanguageMeta));
    }
    if (data.containsKey('adult')) {
      context.handle(
          _adultMeta, adult.isAcceptableOrUnknown(data['adult']!, _adultMeta));
    }
    if (data.containsKey('video')) {
      context.handle(
          _videoMeta, video.isAcceptableOrUnknown(data['video']!, _videoMeta));
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    }
    if (data.containsKey('vote_count')) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableOrUnknown(data['vote_count']!, _voteCountMeta));
    }
    if (data.containsKey('genre_ids')) {
      context.handle(_genreIdsMeta,
          genreIds.isAcceptableOrUnknown(data['genre_ids']!, _genreIdsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Movie.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(attachedDatabase, alias);
  }
}

class Genre extends DataClass implements Insertable<Genre> {
  final int id;
  final String? name;
  Genre({required this.id, this.name});
  factory Genre.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Genre(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    return map;
  }

  GenresCompanion toCompanion(bool nullToAbsent) {
    return GenresCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Genre.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Genre(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
    };
  }

  Genre copyWith({int? id, String? name}) => Genre(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Genre(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Genre && other.id == this.id && other.name == this.name);
}

class GenresCompanion extends UpdateCompanion<Genre> {
  final Value<int> id;
  final Value<String?> name;
  const GenresCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GenresCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<Genre> custom({
    Expression<int>? id,
    Expression<String?>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GenresCompanion copyWith({Value<int>? id, Value<String?>? name}) {
    return GenresCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenresCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $GenresTable extends Genres with TableInfo<$GenresTable, Genre> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenresTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'genres';
  @override
  String get actualTableName => 'genres';
  @override
  VerificationContext validateIntegrity(Insertable<Genre> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Genre map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Genre.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GenresTable createAlias(String alias) {
    return $GenresTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MoviesTable movies = $MoviesTable(this);
  late final $GenresTable genres = $GenresTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movies, genres];
}
