import 'package:bookly_app/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly_app/core/utils/app_router.dart';

Future<void> navigateToHome({
  required BuildContext context,
  required UserModel user,
}) async {
  await Future.delayed(
    const Duration(seconds: 3),
    () {
      GoRouter.of(context).push(AppRouter.kHomeView);
    },
  );
}
