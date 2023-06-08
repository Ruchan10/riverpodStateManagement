import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/arithmetic.dart';

final resultProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);

class addView extends ConsumerWidget {
  const addView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController num0 = TextEditingController();
    TextEditingController num1 = TextEditingController();
    int result = 0;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: num0,
              ),
              TextFormField(
                controller: num1,
              ),
              ElevatedButton(
                onPressed: () {
                  int f = int.parse(num0.text.trim());
                  int s = int.parse(num1.text.trim());
                  var a = ref.read(arithmeticProvider);
                  result = a.add(f, s);
                  ref.read(resultProvider.notifier).state = result;
                },
                child: const Text("ADD"),
              ),
              Text(ref.watch(resultProvider).toString())
            ],
          ),
        ),
      ),
    );
  }
}
