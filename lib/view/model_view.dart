import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/model/student.dart';

import '../view_model/student_viewmodel.dart';

class ModelView extends ConsumerWidget {
  const ModelView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController fnameController = TextEditingController();
    TextEditingController lnameController = TextEditingController();
    TextEditingController dobController = TextEditingController();

    var data = ref.watch(StudentViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: fnameController,
            ),
            TextField(
              controller: lnameController,
            ),
            TextField(
              controller: dobController,
            ),
            ElevatedButton(
              onPressed: () {
                Student student = Student(
                  fname: fnameController.text.trim(),
                  lname: lnameController.text.trim(),
                  dob: dobController.text.trim(),
                );
                ref.read(StudentViewModelProvider.notifier).addStudent(student);
              },
              child: const Text("Add"),
            ),
            data.students.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: data.students.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(data.students[index].fname!),
                          subtitle: Text(data.students[index].fname!),
                          trailing: IconButton(
                            onPressed: () {
                              ref
                                  .read(StudentViewModelProvider.notifier)
                                  .deleteStudent(data.students[index]);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        );
                      },
                    ),
                  )
                : const Text("No Data Found"),
          ],
        ),
      ),
    );
  }
}
