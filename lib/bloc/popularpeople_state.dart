part of 'popularpeople_bloc.dart';

@immutable
abstract class PopularPeopleState {
  final int page;
  final List<PersonPreview> people;
  const PopularPeopleState({required this.people, required this.page});
}

class PopularPeopleInitial extends PopularPeopleState {
  const PopularPeopleInitial({required super.page, required super.people});
}

class PopularPeopleLoaded extends PopularPeopleState {
  const PopularPeopleLoaded({required super.people, required super.page});
}

class PopularPeopleLoading extends PopularPeopleState {
  const PopularPeopleLoading({required super.people, required super.page});
}

class PeopleDetailsLoading extends PopularPeopleState {
  final PersonPreview personPreview;
  const PeopleDetailsLoading(
      {required super.people,
      required this.personPreview,
      required super.page});
}

class PeopleDetailsLoaded extends PopularPeopleState {
  final PersonPreview personPreview;
  final Person person;
  const PeopleDetailsLoaded(
      {required super.people,
      required this.person,
      required this.personPreview,
      required super.page});
}

class PeopleErrorState extends PopularPeopleState {
  final String message;
  PeopleErrorState(this.message, {required super.people, required super.page});
}
