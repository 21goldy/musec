import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musec/SignIn/sign_in.dart';


void main() {
  runApp(const ProviderScope(child: MusecApp()));
}

class MusecApp extends ConsumerWidget {
  const MusecApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
