import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets_data.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
                  height: 64,
                ),
                CustomButton(
                  text: 'LOG IN',
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
                    const Text('Don\'t have an account? '),
                    CustomButton(
                      text: 'SIGN UP',
                      backgroundColor: Colors.transparent,
                      textColor: kPrimaryColor,
                      onPressed: () => GoRouter.of(context).push(
                        AppRouter.kRegisterView,
                      ),
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
