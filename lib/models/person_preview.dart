import 'package:axis_assignment/models/movie.dart';
import 'package:hive/hive.dart';

part 'person_preview.g.dart';

@HiveType(typeId: 2)
class PersonPreview extends HiveObject {
  @HiveField(0)
  bool adult;

  @HiveField(1)
  int gender;

  @HiveField(2)
  int id;

  @HiveField(3)
  String knownForDepartment;

  @HiveField(4)
  String name;

  @HiveField(5)
  String originalName;

  @HiveField(6)
  double popularity;

  @HiveField(7)
  String profilePath;

  @HiveField(8)
  List<Movie> knownFor;
  PersonPreview(
      {required this.adult,
      required this.gender,
      required this.id,
      required this.knownForDepartment,
      required this.name,
      required this.originalName,
      required this.popularity,
      required this.profilePath,
      required this.knownFor});

  factory PersonPreview.fromJson(Map<String, dynamic> json) {
    return PersonPreview(
      adult: json['adult'] ?? false,
      gender: json['gender'] ?? 0,
      id: json['id'] ?? 0,
      knownForDepartment: json['known_for_department'] ?? '',
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      popularity: json['popularity']?.toDouble() ?? 0.0,
      profilePath: json['profile_path'] ?? '',
      knownFor: _parseKnownFor(json['known_for'] ?? []),
    );
  }

  static List<Movie> _parseKnownFor(List<dynamic> knownForList) {
    return knownForList.map((movieJson) => Movie.fromJson(movieJson)).toList();
  }
}
