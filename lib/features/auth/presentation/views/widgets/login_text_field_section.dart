import 'package:bookly_app/core/utils/functions/email_validator.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class LoginTextFieldSection extends StatelessWidget {
  const LoginTextFieldSection({
    super.key,
    this.onChangedEmail,
    this.onChangedPassword,
  });

  final void Function(String)? onChangedEmail;
  final void Function(String)? onChangedPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          validator: (input) {
            if (input != null) {
              return isValidEmail(email: input) ? null : 'Check your email';
            } else {
              return 'Field is require!';
            }
          },
          onChanged: onChangedEmail,
          hintText: 'Email Address',
          iconData: Icons.email_rounded,
        ),
        const SizedBox(
          height: 24,
        ),
        AuthTextField(
          validator: (input) {
            if (input == null || input.isEmpty) {
              return 'Field is require!';
            }

            return null;
          },
          onChanged: onChangedPassword,
          hintText: 'Passowrd',
          iconData: Icons.key_rounded,
          obscureText: true,
        ),
      ],
    );
  }
}
