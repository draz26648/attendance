part of 'attend_cubit.dart';

@immutable
abstract class AttendState {}

class AttendInitial extends AttendState {}

class AttendStart extends AttendState {}

class AttendDone extends AttendState {}

class AttendLoading extends AttendState {}

class AttendLoaded extends AttendState {
  final List<Student> students;
  AttendLoaded(this.students);
}

class AttendError extends AttendStart {}
