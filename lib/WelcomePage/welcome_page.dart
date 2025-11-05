import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
            size: 25,
            color: Colors.black54,
            Icons.arrow_back_ios_rounded),
        actions: [
          Icon(
              size: 25,
              color: Colors.black54,
              Icons.search_rounded),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  child: Icon(color: Colors.white, Icons.skip_previous_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
