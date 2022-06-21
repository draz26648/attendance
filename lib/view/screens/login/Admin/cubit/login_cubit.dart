import 'package:dio/dio.dart';
import 'package:fady/model/models/login_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../model/repositories/login_repo.dart';
import '../../../../../shared/components/componants.dart';
import '../../../Admin_Home/Admin_Home.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  void admin_login({
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
