import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musec/CustomWidgets/custom_form_field.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reEnterPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    reEnterPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/gif/Musec.gif",
            fit: BoxFit.cover,
          ),

          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("SIGN UP", style: GoogleFonts.titanOne(
                    letterSpacing: 1, fontSize: 50, color: Colors.white
                ),),
                SizedBox(height: 80,),
                CustomFormField(hintText: "Email Address", controller: emailController),
                CustomFormField(hintText: "Password", controller: passwordController),
                CustomFormField(hintText: "Re-Enter Password", controller: reEnterPasswordController),
                SizedBox(height: 150,),

                Text("Need Help?", style: GoogleFonts.poppins(
                    letterSpacing: 1, fontSize: 15, color: Colors.white70
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
