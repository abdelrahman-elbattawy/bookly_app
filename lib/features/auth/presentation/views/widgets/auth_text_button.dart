import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  const AuthTextButton({
    super.key,
    required this.textTitle,
    required this.buttonTitle,
    this.onPressed,
  });
  final String textTitle;
  final String buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textTitle),
        CustomButton(
          text: buttonTitle,
          backgroundColor: Colors.transparent,
          textColor: kPrimaryColor,
          onPressed: onPressed,
        )
      ],
    );
  }
}
