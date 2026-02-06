import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musec/WelcomePage/welcome_page.dart';


void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MusecApp()));
}

class MusecApp extends ConsumerWidget {
  const MusecApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
