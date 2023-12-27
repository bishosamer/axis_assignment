import 'package:axis_assignment/bloc/popularpeople_bloc.dart';
import 'package:axis_assignment/models/movie.dart';
import 'package:axis_assignment/models/person.dart';
import 'package:axis_assignment/models/person_preview.dart';
import 'package:axis_assignment/presentation/home_page.dart';
import 'package:axis_assignment/repositories/people_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  Hive.registerAdapter<Movie>(MovieAdapter());
  Hive.registerAdapter<Person>(PersonAdapter());
  Hive.registerAdapter<PersonPreview>(PersonPreviewAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PeopleRepository(),
      child: BlocProvider(
        create: (context) =>
            PopularPeopleBloc(context.read<PeopleRepository>()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomePage(),
        ),
      ),
    );
  }
}
