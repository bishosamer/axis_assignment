import 'dart:convert';
import 'package:axis_assignment/models/person.dart';
import 'package:axis_assignment/models/person_preview.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';

class PeopleRepository {
  PeopleRepository._privateConstructor();

  static final PeopleRepository _instance =
      PeopleRepository._privateConstructor();

  factory PeopleRepository() {
    return _instance;
  }
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = String.fromEnvironment("API_KEY");

  Future<List<PersonPreview>> fetchPopularPeople(int page) async {
    final Box<PersonPreview> box =
        await Hive.openBox('person_page_${page.toString()}');
    if (box.isEmpty) {
      final String endpoint =
          '$baseUrl/person/popular?api_key=$apiKey&page=$page';

      try {
        final response = await http.get(Uri.parse(endpoint));

        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonData = json.decode(response.body);
          final List<dynamic> results = jsonData['results'];

          List<PersonPreview> peopleList = results.map((personData) {
            box.add(PersonPreview.fromJson(personData));
            return PersonPreview.fromJson(personData);
          }).toList();

          return peopleList;
        } else {
          throw Exception('Failed to fetch popular people');
        }
      } catch (error) {
        throw Exception('Error: $error');
      }
    } else {
      return box.values.toList();
    }
  }

  Future<Person> fetchPersonDetails(PersonPreview preview) async {
    final Box<Person> box = await Hive.openBox(preview.id.toString());
    if (box.isEmpty) {
      final String endpoint =
          '$baseUrl/person/${preview.id}?api_key=$apiKey&append_to_response=images&language=en-US';

      try {
        final response = await http.get(Uri.parse(endpoint));

        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonData = json.decode(response.body);
          return Person.fromJson(jsonData);
        } else {
          throw Exception(
              'Failed to fetch people details ${response.statusCode}');
        }
      } catch (error) {
        throw Exception('Error: $error');
      }
    } else {
      return box.values.first;
    }
  }

  Future<void> downloadImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        await ImageGallerySaver.saveImage(response.bodyBytes);
      } else {
        throw (Exception("error downloading image: ${response.statusCode}"));
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
