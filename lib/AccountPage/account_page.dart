import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../CustomWidgets/account_page_item.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 170),
                AccountItem(text: "My Library"),
                AccountItem(text: "Manage Account"),
                AccountItem(text: "Help"),
                AccountItem(text: "Contact Us"),
                AccountItem(text: "Log Out"),
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  "All rights reserved <goldy>",
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
