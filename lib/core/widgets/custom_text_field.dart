import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          suffixIcon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 18,
          ),
          hintText: 'Search',
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
