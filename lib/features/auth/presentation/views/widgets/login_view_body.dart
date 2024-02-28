import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets_data.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/auth_text_button.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/login_text_field_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
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
                const SizedBox(
                  height: 180,
                ),
                Image.asset(AssetsData.logo),
                const SizedBox(
                  height: 80,
                ),
                const LoginTextFieldSection(),
                const SizedBox(
                  height: 64,
                ),
                CustomButton(
                  text: 'LOG IN',
                  backgroundColor: kPrimaryColor,
                  textColor: Colors.white,
                  isLoading: isLoading,
                  onPressed: () async {
                    await navigateToHome(context);
                  },
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                AuthTextButton(
                  textTitle: 'Don\'t have an account? ',
                  buttonTitle: 'SIGN UP',
                  onPressed: () => GoRouter.of(context).push(
                    AppRouter.kRegisterView,
                  ),
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

  Future<void> navigateToHome(BuildContext context) async {
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
