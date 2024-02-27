import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/register_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingView),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const RegisterAppBar(),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Create Your Account',
                  style: Styles.testStyle30,
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Pease enter info to create account',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 60,
                ),
                const CustomAuthTextField(
                  hintText: 'Full Name',
                  iconData: Icons.person_4_rounded,
                ),
                const SizedBox(
                  height: 24,
                ),
                const CustomAuthTextField(
                  hintText: 'Email Address',
                  iconData: Icons.email_rounded,
                ),
                const SizedBox(
                  height: 24,
                ),
                const CustomAuthTextField(
                  hintText: 'Passowrd',
                  iconData: Icons.key_rounded,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                const CustomAuthTextField(
                  hintText: 'Confirm Passowrd',
                  iconData: Icons.key_rounded,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 64,
                ),
                CustomButton(
                  text: 'SIGN UP',
                  backgroundColor: kPrimaryColor,
                  textColor: Colors.white,
                  onPressed: () =>
                      GoRouter.of(context).push(AppRouter.kHomeView),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    CustomButton(
                      text: 'LOG IN',
                      backgroundColor: Colors.transparent,
                      textColor: kPrimaryColor,
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
