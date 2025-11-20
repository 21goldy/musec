import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'SignIn/sign_in.dart';
import 'theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MusecApp()));
}

class MusecApp extends ConsumerWidget {
  const MusecApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.black38),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white24),
        ),
      ),
      home: const SignIn(),
    );
  }
}
