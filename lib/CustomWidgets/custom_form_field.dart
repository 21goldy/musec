import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;

  const CustomFormField({
    super.key,
    required this.hintText,
    required this.iconData,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: isDark? Colors.white54 : Colors.grey.shade400
          ),
          prefixIcon: Icon(
            iconData,
            color: isDark ? Colors.white : Colors.black,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: isDark ? Colors.white30 : Colors.black,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: isDark ? Colors.white : Colors.black,
              width: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
