import 'package:bloc/bloc.dart';
import 'package:fady/model/models/subject_model.dart';
import 'package:fady/model/repositories/subject_repo.dart';
import 'package:meta/meta.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit() : super(SubjectInitial());

  void getSubject({
    @required String email,
  }) async {
    emit(SubjectLoading());
    try {
      SubjectModel _res = await SubjectRepo.getSubject(email: email);
      if (_res.coursesNames.isNotEmpty) {
        emit(SubjectLoaded(subjects: _res.coursesNames));
      }
    } catch (e) {
      emit(SubjectError(e.toString()));
    }
  }
}
