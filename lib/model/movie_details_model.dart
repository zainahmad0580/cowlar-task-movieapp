import '../controller/date_controller.dart';
import 'genre_model.dart';
import 'movie_model.dart';
import 'production_companies_model.dart';
import 'production_countries_model.dart';
import 'spoken_languages_model.dart';

class MovieDetailsModel extends MovieModel {
  String? belongsToCollection;
  int? budget;
  List<GenreModel>? genres;
  String? homepage;
  String? imdbId;
  List<ProductionCompaniesModel>? productionCompanies;
  List<ProductionCountriesModel>? productionCountries;
  int? revenue;
  int? runtime;
  List<SpokenLanguagesModel>? spokenLanguages;
  String? status;
  String? tagline;

  MovieDetailsModel({
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.imdbId,
    this.productionCompanies,
    this.productionCountries,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    // Include fields from the base class
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          genreIds: genreIds,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <GenreModel>[];
      json['genres'].forEach((v) {
        genres!.add(GenreModel.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompaniesModel>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(ProductionCompaniesModel.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountriesModel>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(ProductionCountriesModel.fromJson(v));
      });
    }
    releaseDate = DateController.getDateFormatMDY(json['release_date']);
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguagesModel>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(SpokenLanguagesModel.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        super.toJson(); // Include base class fields

    data['belongs_to_collection'] = belongsToCollection;
    data['budget'] = budget;
    data['genres'] = genres?.map((genre) => genre.toJson()).toList();
    data['homepage'] = homepage;
    data['imdb_id'] = imdbId;
    data['production_companies'] =
        productionCompanies?.map((company) => company.toJson()).toList();
    data['production_countries'] =
        productionCountries?.map((country) => country.toJson()).toList();
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['spoken_languages'] =
        spokenLanguages?.map((language) => language.toJson()).toList();
    data['status'] = status;
    data['tagline'] = tagline;

    return data;
  }
}
