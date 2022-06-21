import 'package:bloc/bloc.dart';
import 'package:fady/model/models/attend_model.dart';
import 'package:fady/model/models/base_models/students.dart';
import 'package:fady/model/repositories/attend_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'attend_state.dart';

class AttendCubit extends Cubit<AttendState> {
  AttendCubit() : super(AttendInitial());

  static AttendCubit get(context) => BlocProvider.of<AttendCubit>(context);

  void loadAttendances({
    @required String day,
    @required String school_year,
    @required String start_time,
  }) async {
    emit(AttendLoading());
    AttendModel response = await AttendRepo.getAttendance(
      day: day,
      school_year: school_year,
      start_time: start_time,
    );
    if (response.students != null) {
      emit(AttendLoaded(response));
    }
  }
}
