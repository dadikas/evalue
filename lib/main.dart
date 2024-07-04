
import 'package:flutter/material.dart';
import 'package:evalue/sence/UI/engine.dart'; // Assuming your engine code is in engine.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GLFW Engine with Flutter'),
        ),
        body: const Center(
          child: Engine(),
        ),
      ),
    );
  }
}
