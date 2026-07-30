import 'package:flutter/material.dart';

class BloodPressureApp extends StatelessWidget {
  const BloodPressureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Pressure App',
      home: Scaffold(body: Center(child: Text('Blood Pressure App'))),
    );
  }
}
