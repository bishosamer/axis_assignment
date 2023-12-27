import 'package:axis_assignment/presentation/details_page.dart';
import 'package:flutter/material.dart';
import 'package:axis_assignment/models/person_preview.dart';

class PersonPreviewWidget extends StatelessWidget {
  final PersonPreview personPreview;

  const PersonPreviewWidget({Key? key, required this.personPreview})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: personPreview.profilePath != ''
              ? NetworkImage(
                  'https://image.tmdb.org/t/p/w500${personPreview.profilePath}')
              : null,
        ),
        title: Text(personPreview.name),
        subtitle: Text(personPreview.knownForDepartment),
        trailing: Text('Popularity: ${personPreview.popularity.toString()}'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PersonDetailsPage(personPreview: personPreview)));
        },
      ),
    );
  }

  void _showDetailsDialog(BuildContext context, PersonPreview personPreview) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(personPreview.name),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Department: ${personPreview.knownForDepartment}'),
                Text('Popularity: ${personPreview.popularity.toString()}'),
                Text('Known For:'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: personPreview.knownFor.map((movie) {
                    return Text('- ${movie.title}');
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
