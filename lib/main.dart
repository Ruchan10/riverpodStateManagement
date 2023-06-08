import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/view/add_view.dart';
import 'package:riverpod_state_management/view/counter_view.dart';
import 'package:riverpod_state_management/view/dashboard_view.dart';
import 'package:riverpod_state_management/view/model_view.dart';
import 'package:riverpod_state_management/view/si_view.dart';
import 'package:riverpod_state_management/view/student_view.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Riverpod state management',
        initialRoute: '/',
        routes: {
          '/': (context) => const DashboardView(),
          '/counter': (context) => const counterView(),
          '/add': (context) => const addView(),
          '/siRoute': (context) => const SiView(),
          '/studentRoute': (context) => const ModelView(),
          '/studentDetailsRoute': (context) => const StudentView(),
        },
      ),
    ),
  );
}
