import 'package:bloc/bloc.dart';
import 'package:fady/model/models/attend_model.dart';
import 'package:fady/model/models/base_models/students.dart';
import 'package:fady/model/repositories/attend_repo.dart';
import 'package:meta/meta.dart';

part 'attend_state.dart';

class AttendCubit extends Cubit<AttendState> {
  AttendCubit() : super(AttendInitial());

  void startAttend() async {
    emit(AttendStart());
    try {
      await AttendRepo.startAutoAttendance();
      emit(AttendDone());
    } catch (e) {
      emit(AttendError());
    }
  }

  Future getAttendance() async {
    emit(AttendLoading());
    try {
      AttendModel _res = await AttendRepo.getAutoAttendance();
      if (_res.status == 'Success') {
        emit(AttendLoaded(_res.students));
      }
    } catch (e) {
      print(e.toString());
      emit(AttendError());
    }
  }
}
