import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets_data.dart';
import 'package:bookly_app/core/utils/functions/custom_snack_bar.dart';
import 'package:bookly_app/core/utils/functions/navigate_to_home.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/auth_text_button.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/login_text_field_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isLoading = false;
  String? emailTextField;
  String? passTextField;

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomScrollView(
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
                  LoginTextFieldSection(
                    onChangedEmail: (value) => emailTextField = value,
                    onChangedPassword: (value) => passTextField = value,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) async {
                      if (state is LoginSuccess) {
                        CustomSnakBar.showSnack(
                          context: context,
                          snackBarType: SnackBarType.success,
                          errMessage: 'Login successfully!',
                        );

                        isLoading = false;

                        await navigateToHome(
                            context: context, user: state.user);
                      } else if (state is LoginFailure) {
                        isLoading = false;

                        CustomSnakBar.showSnack(
                          context: context,
                          snackBarType: SnackBarType.error,
                          errMessage: state.errMessage,
                        );
                      } else {
                        isLoading = true;
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        text: 'LOG IN',
                        backgroundColor: kPrimaryColor,
                        textColor: Colors.white,
                        isLoading: isLoading,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).loginUser(
                              email: emailTextField!,
                              password: passTextField!,
                            );

                            formKey.currentState!.save();
                          }
                        },
                      );
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
      ),
    );
  }
}
