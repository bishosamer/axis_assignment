import 'package:axis_assignment/bloc/popularpeople_bloc.dart';
import 'package:axis_assignment/presentation/widgets/person_preview.dart';
import 'package:axis_assignment/repositories/people_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PopularPeopleBloc, PopularPeopleState>(
        listener: (context, state) {
          print('state changed to ' + state.toString());
        },
        builder: (context, state) {
          if (state is PopularPeopleInitial) {
            controller.addListener(() {
              if (controller.offset >= controller.position.maxScrollExtent &&
                  !controller.position.outOfRange) {
                context.read<PopularPeopleBloc>().add(LoadPeople());
              }
            });
            context.read<PopularPeopleBloc>().add(LoadPeople());
          }

          return state.people.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  controller: controller,
                  itemCount: state.people.length,
                  itemBuilder: (context, index) {
                    return PersonPreviewWidget(
                        personPreview: state.people[index]);
                  });
        },
      ),
    );
  }
}
