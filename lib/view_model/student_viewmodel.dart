import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/model/student.dart';

import '../state/student_state.dart';

// State Notifier Provider
final StudentViewModelProvider =
    StateNotifierProvider<StudentViewModel, StudentState>(
  (ref) => StudentViewModel(),
);

class StudentViewModel extends StateNotifier<StudentState> {
  StudentViewModel() : super(StudentState.initialState()) {
    getAllStudents();
  }
  void getAllStudents() {
    state.students.add(Student(fname: "R", lname: "K", dob: "1999"));
    state.students
        .add(Student(fname: "Ruchan", lname: "Kayastha", dob: "2000"));
    state.students.add(Student(fname: "RK", lname: "Ktha", dob: "2002"));
  }

  // Add Students
  void addStudent(Student student) {
    state = state.copyWith(isLoading: true);

    //add students data
    state.students.add(student);

    state = state.copyWith(isLoading: false);
  }

  void deleteStudent(Student student) {
    state = state.copyWith(isLoading: true);
    state.students.remove(student);

    state = state.copyWith(isLoading: false);
  }
}
