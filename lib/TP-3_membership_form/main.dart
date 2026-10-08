import 'package:aix_1/TP-3_membership_form/membership_form_screen./membership_form_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SportClubApp());
}

class SportClubApp extends StatelessWidget {
  const SportClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SportClub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        useMaterial3: true,
      ),
      home: const MembershipFormScreen(),
    );
  }
}
