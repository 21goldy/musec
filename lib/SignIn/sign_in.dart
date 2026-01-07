import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musec/CustomWidgets/custom_form_field.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/gif/Musec.gif", fit: BoxFit.cover),

          Container(color: Colors.black.withOpacity(0.5)),

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SIGN IN",
                  style: GoogleFonts.titanOne(letterSpacing: 1, fontSize: 50, color: Colors.white),
                ),
                SizedBox(height: 80),
                CustomFormField(
                  hintText: "Email Address",
                  controller: emailController,
                ),
                CustomFormField(
                  hintText: "Password",
                  controller: passwordController,
                ),
                SizedBox(height: 250),

                Text(
                  "Forgot Password?",
                  style: GoogleFonts.poppins(letterSpacing: 1, fontSize: 15, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
