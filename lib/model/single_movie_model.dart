import 'package:json_annotation/json_annotation.dart';

part 'single_movie_model.g.dart';

@JsonSerializable()
class SingleMovieModel {
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  BelongsToCollection? belongsToCollection;
  int budget;
  List<Genre> genres;
  String? homepage;
  int id;
  @JsonKey(name: 'imdb_id')
  String? imdbId;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String? overview;
  double popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany> productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry> productionCountries;
  @JsonKey(name: 'release_date')
  DateTime releaseDate;
  int revenue;
  int? runtime;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage> spokenLanguages;
  String status;
  String? tagline;
  String title;
  bool video;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
  SingleMovieModel({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    this.runtime,
    required this.spokenLanguages,
    required this.status,
    this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory SingleMovieModel.fromJson(Map<String, dynamic> data) =>
      _$SingleMovieModelFromJson(data);
  Map<String, dynamic> toJson() => _$SingleMovieModelToJson(this);
}

@JsonSerializable()
class BelongsToCollection {
  int id;
  String name;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  BelongsToCollection({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> data) =>
      _$BelongsToCollectionFromJson(data);
  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}

@JsonSerializable()
class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });
  factory Genre.fromJson(Map<String, dynamic> data) => _$GenreFromJson(data);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class ProductionCompany {
  int id;
  @JsonKey(name: 'logo_path')
  String? logoPath;
  String name;
  @JsonKey(name: 'origin_country')
  String originCountry;

  ProductionCompany({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });
  factory ProductionCompany.fromJson(Map<String, dynamic> data) =>
      _$ProductionCompanyFromJson(data);
  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable()
class ProductionCountry {
  @JsonKey(name: 'iso_3166_1')
  String iso31661;
  String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });
  factory ProductionCountry.fromJson(Map<String, dynamic> data) =>
      _$ProductionCountryFromJson(data);
  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable()
class SpokenLanguage {
  @JsonKey(name: 'english_name')
  String englishName;
  @JsonKey(name: 'iso_639_1')
  String iso6391;
  String? name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    this.name,
  });
  factory SpokenLanguage.fromJson(Map<String, dynamic> data) =>
      _$SpokenLanguageFromJson(data);
  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
