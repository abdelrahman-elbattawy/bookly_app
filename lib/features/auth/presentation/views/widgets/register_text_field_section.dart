import 'package:bookly_app/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class RegisterTextFieldSection extends StatelessWidget {
  const RegisterTextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AuthTextField(
          hintText: 'Full Name',
          iconData: Icons.person_4_rounded,
        ),
        SizedBox(
          height: 24,
        ),
        AuthTextField(
          hintText: 'Email Address',
          iconData: Icons.email_rounded,
        ),
        SizedBox(
          height: 24,
        ),
        AuthTextField(
          hintText: 'Passowrd',
          iconData: Icons.key_rounded,
          obscureText: true,
        ),
        SizedBox(
          height: 24,
        ),
        AuthTextField(
          hintText: 'Confirm Passowrd',
          iconData: Icons.key_rounded,
          obscureText: true,
        ),
      ],
    );
  }
}
