part of 'attend_cubit.dart';

@immutable
abstract class AttendState {}

class AttendInitial extends AttendState {}

class AttendLoading extends AttendState {}

class AttendLoaded extends AttendState {
  final AttendModel attendances;

  AttendLoaded(this.attendances);
}

class AttendError extends AttendState {
  final String error;

  AttendError(this.error);
}
