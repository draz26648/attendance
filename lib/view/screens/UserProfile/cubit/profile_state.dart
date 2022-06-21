part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileModel profileModel;

  ProfileSuccess({this.profileModel});
}

class ProfileError extends ProfileState {
  String error;
  ProfileError({this.error});
}
