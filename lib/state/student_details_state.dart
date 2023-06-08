import '../model/student_details.dart';

class StudentDetailsState {
  bool isLoading;
  List<StudentDetails> students;

  StudentDetailsState({required this.isLoading, required this.students});

  // initial State
  StudentDetailsState.initialState()
      : this(
          isLoading: false,
          students: [],
        );

  // create copyWith function
  StudentDetailsState copyWith(
      {bool? isLoading, List<StudentDetails>? students}) {
    return StudentDetailsState(
      isLoading: isLoading ?? this.isLoading,
      students: students ?? this.students,
    );
  }
}
