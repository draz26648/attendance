import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fady/helpers/shared_helper.dart';
import 'package:fady/model/repositories/login_repo.dart';
import 'package:fady/view/screens/login/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/models/login_model.dart';

import '../../Home/Attendance_Home_Screen.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void doctor_login({
    @required String email,
    @required String password,
    @required bool isAdmin,
  }) async {
    try {
      emit(LoginLoadingState());
      LoginModel _response = await LoginRepo.login(
        email: email,
        password: password,
        isAdmin: isAdmin,
      );
      if (_response.status == 'Success') {
        emit(LoginSuccessState(loginModel: _response));
        SharedHelper().writeData(CachingKey.FIRST_NAME, _response.first_name);
        SharedHelper().writeData(CachingKey.LAST_NAME, _response.last_name);
        SharedHelper().writeData(CachingKey.EMAIL, _response.email);
      } else {
        emit(LoginErrorState('Wrong Email or Password'));
      }
    } catch (e) {
      print(e.toString());
      emit(LoginErrorState(e.toString()));
    }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(LoginChangePasswordVisibilityState());
  }
}
