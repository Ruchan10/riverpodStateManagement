import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// creating  a provider
final numberProvider = StateProvider<int>(
  (ref) {
    return 1;
  },
);
final nameProvider = Provider<String>(
  (ref) {
    return "Ruchan";
  },
);
//ProviderRef : Provider -> Provider
//WidgetRef : Widget -> Provider

class counterView extends ConsumerWidget {
  const counterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ref.watch(numberProvider).toString(),
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              ref.read(nameProvider),
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          ref.read(numberProvider.notifier).state++,
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
