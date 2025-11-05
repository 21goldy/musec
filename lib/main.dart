import 'package:flutter/material.dart';
import 'package:musec/WelcomePage/welcome_page.dart';

void main() {
  runApp(const MusecApp());
}

class MusecApp extends StatefulWidget {
  const MusecApp({super.key});

  @override
  State<MusecApp> createState() => _MusecAppState();
}

class _MusecAppState extends State<MusecApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
