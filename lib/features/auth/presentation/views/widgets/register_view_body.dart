import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/functions/custom_snack_bar.dart';
import 'package:bookly_app/core/utils/functions/navigate_to_home.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/auth_text_button.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/register_app_bar.dart';
import 'package:bookly_app/features/auth/presentation/views/widgets/register_text_field_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
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
                  RegisterTextFieldSection(
                    onChangedEmail: (value) => emailTextField = value,
                    onChangedPassword: (value) => passTextField = value,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) async {
                      if (state is RegisterSuccess) {
                        CustomSnakBar.showSnack(
                          context: context,
                          snackBarType: SnackBarType.success,
                          errMessage: 'Created user successfully!',
                        );

                        await navigateToHome(
                            context: context, user: state.user);

                        isLoading = false;
                      } else if (state is RegisterFailure) {
                        CustomSnakBar.showSnack(
                          context: context,
                          snackBarType: SnackBarType.error,
                          errMessage: state.errMessage,
                        );

                        isLoading = false;
                      } else {
                        isLoading = true;
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        text: 'SIGN UP',
                        backgroundColor: kPrimaryColor,
                        textColor: Colors.white,
                        isLoading: isLoading,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).registerUser(
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
      ),
    );
  }
}
