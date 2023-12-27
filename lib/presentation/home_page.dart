import 'package:axis_assignment/bloc/popularpeople_bloc.dart';
import 'package:axis_assignment/presentation/widgets/person_preview_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularPeopleBloc, PopularPeopleState>(
      listener: (context, state) {
        if (kDebugMode) {
          print('state changed to ' + state.toString());
        }
      },
      builder: (context, state) {
        if (state is PeopleErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is PopularPeopleInitial) {
          controller.addListener(() {
            if (controller.offset >= controller.position.maxScrollExtent &&
                !controller.position.outOfRange) {
              context.read<PopularPeopleBloc>().add(LoadPeople());
            }
          });
          context.read<PopularPeopleBloc>().add(LoadPeople());
        }

        return Scaffold(
            appBar: AppBar(
              title: Text("Popular People"),
              actions: [
                state is PopularPeopleLoading
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                    : Container()
              ],
            ),
            body: state.people.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    controller: controller,
                    itemCount: state.people.length,
                    itemBuilder: (context, index) {
                      return PersonPreviewWidget(
                          personPreview: state.people[index]);
                    }));
      },
    );
  }
}
