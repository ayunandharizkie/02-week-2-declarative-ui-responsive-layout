import 'package:flutter/material.dart';
import 'academic_dashboard_screen.dart';
import 'studi kasus/ruang_praktikum.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Akademik TRPL',
      //home: const AcademicDashboardScreen(),
      home: const RuangPraktikum(),
    );
  }
}