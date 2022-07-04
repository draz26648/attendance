part of 'subject_cubit.dart';

@immutable
abstract class SubjectState {}

class SubjectInitial extends SubjectState {}

class SubjectLoading extends SubjectState {}

class SubjectLoaded extends SubjectState {
  final List<String> subjects;
  SubjectLoaded({this.subjects});
}

class SubjectError extends SubjectState {
  final String error;
  SubjectError(this.error);
}
