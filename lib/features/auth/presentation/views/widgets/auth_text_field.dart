import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.iconData,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  });

  final String hintText;
  final IconData iconData;
  final bool obscureText;

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onChanged: onChanged,
      style: Styles.testStyle18,
      autocorrect: false,
      enableSuggestions: false,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          iconData,
          size: 24,
        ),
        hintText: hintText,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(color: kPrimaryColor),
        errorBorder: buildBorder(color: Colors.red),
        focusedErrorBorder: buildBorder(color: Colors.red),
      ),
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
