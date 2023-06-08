import '../model/student.dart';

class StudentState {
  bool isLoading;
  List<Student> students;

  StudentState({
    required this.isLoading,
    required this.students,
  });

  // initial state
  StudentState.initialState()
      : this(
          isLoading: false,
          students: [],
        );

  // copyWith previous value
  StudentState copyWith({bool? isLoading, List<Student>? students}) {
    return StudentState(
    isLoading: isLoading ?? this.isLoading,
    students: students ?? this.students,
    );
  }
}
