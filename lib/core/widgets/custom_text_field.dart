import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.iconData,
    this.onChanged,
  });

  final String hintText;
  final IconData iconData;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          suffixIcon: Icon(
            iconData,
            size: 18,
          ),
          hintText: hintText,
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(color: kPrimaryColor),
          errorBorder: buildBorder(color: Colors.red)),
    );
  }

  OutlineInputBorder buildBorder({Color color = Colors.white}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
