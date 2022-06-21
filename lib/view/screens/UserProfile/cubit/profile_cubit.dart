import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fady/helpers/shared_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../model/models/profile_model.dart';
import '../../../../model/repositories/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  void getProfile() async {
    emit(ProfileLoading());
    String firstName = await SharedHelper().readString(CachingKey.FIRST_NAME);
    String lastName = await SharedHelper().readString(CachingKey.LAST_NAME);
    ProfileModel _response = await ProfileRepo.getProfile(
      first_name: firstName,
      last_name: lastName,
    );
    if (_response.status == 'Success') {
      emit(ProfileSuccess(profileModel: _response));
    } else {
      emit(ProfileError(error: 'Error'));
    }
  }
}
