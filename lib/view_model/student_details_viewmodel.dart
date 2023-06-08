import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/student_details.dart';
import '../state/student_details_state.dart';

final StudentDetailsViewModelProvider =
    StateNotifierProvider<StudentDetailsViewModel, StudentDetailsState>(
  (ref) => StudentDetailsViewModel(),
);

class StudentDetailsViewModel extends StateNotifier<StudentDetailsState> {
  StudentDetailsViewModel() : super(StudentDetailsState.initialState()) {
    getInitialData();
  }
  void getInitialData() {}

  // Add Students
  void addStudent(StudentDetails student) {
    state = state.copyWith(isLoading: true);

    //add students data
    state.students.add(student);

    state = state.copyWith(isLoading: false);
  }

  void deleteStudent(StudentDetails student) {
    state = state.copyWith(isLoading: true);
    state.students.remove(student);

    state = state.copyWith(isLoading: false);
  }
}
