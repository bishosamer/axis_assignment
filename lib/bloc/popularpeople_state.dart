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
