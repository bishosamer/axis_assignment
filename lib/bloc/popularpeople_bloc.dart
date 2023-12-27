import 'dart:async';

import 'package:axis_assignment/models/person.dart';
import 'package:axis_assignment/models/person_preview.dart';
import 'package:axis_assignment/repositories/people_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'popularpeople_event.dart';
part 'popularpeople_state.dart';

class PopularPeopleBloc extends Bloc<PopularpeopleEvent, PopularPeopleState> {
  PopularPeopleBloc(PeopleRepository repo)
      : super(const PopularPeopleInitial(page: 1, people: [])) {
    on<LoadPeople>((event, emit) async {
      emit(PopularPeopleLoading(page: state.page, people: state.people));
      List<PersonPreview> people = [
        ...state.people,
        ...await repo.fetchPopularPeople(state.page)
      ];
      emit(PopularPeopleLoaded(people: people, page: state.page + 1));
    });
  }
}
