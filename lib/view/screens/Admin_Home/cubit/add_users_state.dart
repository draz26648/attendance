part of 'add_users_cubit.dart';

@immutable
abstract class AddUsersState {}

class AddUsersInitial extends AddUsersState {}

class AddUsersLoading extends AddUsersState {}

class AddUsersSuccess extends AddUsersState {
  final String message;

  AddUsersSuccess({this.message});
}

class AddUsersError extends AddUsersState {
  String error;
  AddUsersError({this.error});
}
