import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/auth_text_button.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/register_app_bar.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/register_text_field_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  bool isLoading = false;

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
                const RegisterTextFieldSection(),
                const SizedBox(
                  height: 64,
                ),
                CustomButton(
                  text: 'SIGN UP',
                  backgroundColor: kPrimaryColor,
                  textColor: Colors.white,
                  isLoading: isLoading,
                  onPressed: () async {
                    await navigatToHome(context);
                  },
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                AuthTextButton(
                  textTitle: 'Already have an account? ',
                  buttonTitle: 'LOG IN',
                  onPressed: () => Navigator.pop(context),
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

  Future<void> navigatToHome(BuildContext context) async {
    setState(() => isLoading = true);
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() => isLoading = false);
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
