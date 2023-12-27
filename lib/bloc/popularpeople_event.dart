part of 'popularpeople_bloc.dart';

@immutable
abstract class PopularpeopleEvent {}

class LoadPeople extends PopularpeopleEvent {}

class LoadPeopleDetails extends PopularpeopleEvent {
  final PersonPreview personPreview;

  LoadPeopleDetails({required this.personPreview});
}
