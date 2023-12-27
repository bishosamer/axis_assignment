import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  bool adult;

  @HiveField(1)
  String backdropPath;

  @HiveField(2)
  int id;

  @HiveField(3)
  String title;

  @HiveField(4)
  String originalLanguage;

  @HiveField(5)
  String originalTitle;

  @HiveField(6)
  String overview;

  @HiveField(7)
  String posterPath;

  @HiveField(8)
  String mediaType;

  @HiveField(9)
  List<int> genreIds;

  @HiveField(10)
  double popularity;

  @HiveField(11)
  String releaseDate;

  @HiveField(12)
  bool video;

  @HiveField(13)
  double voteAverage;

  @HiveField(14)
  int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      mediaType: json['media_type'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      popularity: json['popularity']?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      video: json['video'] ?? false,
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}
