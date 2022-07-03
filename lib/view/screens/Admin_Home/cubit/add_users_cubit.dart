import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fady/model/repositories/add_user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../../../model/models/add_user_model.dart';

part 'add_users_state.dart';

class AddUsersCubit extends Cubit<AddUsersState> {
  AddUsersCubit() : super(AddUsersInitial());
  static AddUsersCubit get(context) => BlocProvider.of(context);

  void addStudent({
    @required String first_name,
    @required String last_name,
    @required String email,
    @required int age,
    @required int phone,
    @required String address,
    @required String gender,
    @required String school_year,
  }) async {
    emit(AddUsersLoading());
    AddUser response = await AddUserRepo.addStudent(
        first_name: first_name,
        last_name: last_name,
        email: email,
        age: age,
        phone: phone,
        address: address,
        gender: gender,
        school_year: school_year);

    if (response.status == 'success') {
      emit(AddUsersSuccess(message: response.status));
    } else {
      emit(AddUsersError(error: response.status));
    }
  }

  void addLecturer({
    @required String first_name,
    @required String last_name,
    @required String email,
    @required String password,
    @required int phone,
    @required String address,
    @required String gender,
  }) async {
    emit(AddUsersLoading());
   try{
     Response response = await AddUserRepo.addLecturer(
       first_name: first_name,
       last_name: last_name,
       email: email,
       password: password,
       phone: phone,
       address: address,
       gender: gender,
     );
     emit(AddUsersSuccess(message: 'Success'));
     Fluttertoast.showToast(msg: 'Success');
   }catch(e){
     emit(AddUsersError(error: e.toString()));
   }

  }
}
