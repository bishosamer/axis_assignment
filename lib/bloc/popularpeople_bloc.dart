import 'package:flutter/material.dart';
import 'package:axis_assignment/models/person.dart';
import 'package:axis_assignment/models/person_preview.dart';
import 'package:axis_assignment/repositories/people_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'popularpeople_event.dart';
part 'popularpeople_state.dart';

class PopularPeopleBloc extends Bloc<PopularpeopleEvent, PopularPeopleState> {
  PopularPeopleBloc(PeopleRepository repo)
      : super(const PopularPeopleInitial(page: 1, people: [])) {
    on<LoadPeople>((event, emit) async {
      try {
        emit(PopularPeopleLoading(page: state.page, people: state.people));
        List<PersonPreview> people = [
          ...state.people,
          ...await repo.fetchPopularPeople(state.page)
        ];
        emit(PopularPeopleLoaded(people: people, page: state.page + 1));
      } on Exception catch (e) {
        emit(PeopleErrorState(e.toString(),
            people: state.people, page: state.page));
      }
    });
    on<LoadPeopleDetails>((event, emit) async {
      try {
        emit(PeopleDetailsLoading(
            people: state.people,
            personPreview: event.personPreview,
            page: state.page));
        Person details = await repo.fetchPersonDetails(event.personPreview);
        emit(PeopleDetailsLoaded(
            people: state.people,
            person: details,
            personPreview: event.personPreview,
            page: state.page));
      } on Exception catch (e) {
        emit(PeopleErrorState(e.toString(),
            people: state.people, page: state.page));
      }
    });
  }
}
