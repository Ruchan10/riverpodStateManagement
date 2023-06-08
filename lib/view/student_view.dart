import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/student_details.dart';
import '../view_model/student_details_viewmodel.dart';

final dropDownValueProvider = StateProvider<String>(
  (ref) {
    return "Flutter";
  },
);

final totalMarksProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);
final resultProvider = StateProvider<String>(
  (ref) {
    return "Pass";
  },
);
final divisionProvider = StateProvider<String>(
  (ref) {
    return "1st";
  },
);
final markObtainedProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);
final percentageProvider = StateProvider<double>(
  (ref) {
    return 0;
  },
);

class StudentView extends ConsumerWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController fnameController = TextEditingController();
    TextEditingController lnameController = TextEditingController();
    TextEditingController marksController = TextEditingController();

    String dropdownValue = 'Flutter';
    var data = ref.watch(StudentDetailsViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student Details"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: fnameController,
            decoration: const InputDecoration(
              label: Text("First Name"),
            ),
          ),
          TextFormField(
            controller: lnameController,
            decoration: const InputDecoration(
              label: Text("Last Name"),
            ),
          ),
          DropdownButton<String>(
            value: ref.read(dropDownValueProvider),
            items: <String>['Flutter', 'Web API', 'Design Thinking', 'IoT']
                .map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              },
            ).toList(),
            onChanged: (String? newValue) {
              ref.read(dropDownValueProvider.notifier).state = newValue!;
            },
          ),
          TextFormField(
            controller: marksController,
            decoration: const InputDecoration(
              label: Text("Marks"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              StudentDetails student = StudentDetails(
                fname: fnameController.text.trim(),
                lname: lnameController.text.trim(),
                module: dropdownValue,
                marks: int.parse(marksController.text.trim()),
              );
              ref
                  .read(StudentDetailsViewModelProvider.notifier)
                  .addStudent(student);

              ref.read(markObtainedProvider.notifier).state +=
                  int.parse(marksController.text.trim());

              ref.read(totalMarksProvider.notifier).state += 100;
              ref.read(percentageProvider.notifier).state =
                  (ref.watch(markObtainedProvider) /
                          ref.watch(totalMarksProvider)) *
                      100;
              if (ref.watch(percentageProvider) < 60 &&
                  ref.watch(totalMarksProvider) > 49) {
                ref.read(divisionProvider.notifier).state = "2nd";
              } else if (ref.watch(percentageProvider) < 50 &&
                  ref.watch(totalMarksProvider) > 39) {
                ref.read(divisionProvider.notifier).state = "2nd";
              }
              for (StudentDetails s in data.students) {
                if (s.marks! < 40) {
                  ref.read(resultProvider.notifier).state = "Fail";
                  ref.read(divisionProvider.notifier).state = "No Division";
                }
              }
            },
            child: const Text("Add"),
          ),
          DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
              (states) => Colors.green,
            ),
            border: TableBorder.all(color: Colors.black),
            columns: const [
              DataColumn(
                label: Expanded(
                  child: Text('Name', textAlign: TextAlign.center),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text('Module', textAlign: TextAlign.center),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text('Marks', textAlign: TextAlign.center),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text('Action', textAlign: TextAlign.center),
                ),
              )
            ],
            rows: [
              for (StudentDetails s in data.students) ...{
                DataRow(
                  cells: [
                    DataCell(
                      Expanded(
                        child: Center(
                          child: Text("${s.fname!}${s.lname!}"),
                        ),
                      ),
                    ),
                    DataCell(
                      Expanded(
                        child: Center(
                          child: Text(s.module!),
                        ),
                      ),
                    ),
                    DataCell(
                      Expanded(
                        child: Center(
                          child: Text(s.marks!.toString()),
                        ),
                      ),
                    ),
                    DataCell(
                      Expanded(
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              ref
                                  .read(
                                      StudentDetailsViewModelProvider.notifier)
                                  .deleteStudent(s);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              }
            ],
          ),
          Text("Obtained Marks:- ${ref.watch(markObtainedProvider)}"),
          Text("Total Marks:- ${ref.watch(totalMarksProvider)}"),
          Text("Result:- ${ref.watch(resultProvider)}"),
          Text("Division:- ${ref.watch(divisionProvider)}"),
        ],
      ),
    );
  }
}
