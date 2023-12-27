import 'package:axis_assignment/models/movie.dart';
import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person extends HiveObject {
  @HiveField(0)
  bool adult;

  @HiveField(1)
  List<String> alsoKnownAs;

  @HiveField(2)
  String biography;

  @HiveField(3)
  String birthday;

  @HiveField(4)
  String deathday;

  @HiveField(5)
  int gender;

  @HiveField(6)
  String homepage;

  @HiveField(7)
  int id;

  @HiveField(8)
  String imdbId;

  @HiveField(9)
  String knownForDepartment;

  @HiveField(10)
  String name;

  @HiveField(11)
  String placeOfBirth;

  @HiveField(12)
  double popularity;

  @HiveField(13)
  String profilePath;

  @HiveField(14)
  List<Movie> knownFor; // New field representing known movies for the person

  Person({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
    required this.knownFor, // Updated constructor to include knownFor parameter
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      adult: json['adult'] ?? false,
      alsoKnownAs: List<String>.from(json['also_known_as'] ?? []),
      biography: json['biography'] ?? '',
      birthday: json['birthday'] ?? '',
      deathday: json['deathday'] ?? '',
      gender: json['gender'] ?? 0,
      homepage: json['homepage'] ?? '',
      id: json['id'] ?? 0,
      imdbId: json['imdb_id'] ?? '',
      knownForDepartment: json['known_for_department'] ?? '',
      name: json['name'] ?? '',
      placeOfBirth: json['place_of_birth'] ?? '',
      popularity: json['popularity']?.toDouble() ?? 0.0,
      profilePath: json['profile_path'] ?? '',
      knownFor:
          _parseKnownFor(json['known_for'] ?? []), // Parse knownFor movies
    );
  }

  static List<Movie> _parseKnownFor(List<dynamic> knownForList) {
    return knownForList.map((movieJson) => Movie.fromJson(movieJson)).toList();
  }
}
