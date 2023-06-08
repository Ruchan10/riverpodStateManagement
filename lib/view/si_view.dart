import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/arithmetic.dart';

final resultProvider = StateProvider<double>(
  (ref) {
    return 0;
  },
);

class SiView extends ConsumerWidget {
  const SiView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController num0 = TextEditingController();
    TextEditingController num1 = TextEditingController();
    TextEditingController num2 = TextEditingController();
    double result = 0;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: num0,
                decoration: const InputDecoration(
                  labelText: "Enter Principle",
                ),
              ),
              TextFormField(
                controller: num1,
                decoration: const InputDecoration(
                  labelText: "Enter Time in years",
                ),
              ),
              TextFormField(
                controller: num2,
                decoration: const InputDecoration(
                  labelText: "Enter Rate",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  int f = int.parse(num0.text.trim());
                  int s = int.parse(num1.text.trim());
                  int t = int.parse(num2.text.trim());
                  var a = ref.read(arithmeticProvider);
                  result = a.si(f, s, t);
                  ref.read(resultProvider.notifier).state = result;
                },
                child: const Text("Calculate SI"),
              ),
              Text("SI:- ${ref.watch(resultProvider)}")
            ],
          ),
        ),
      ),
    );
  }
}
