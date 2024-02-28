import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_circle_progress_indicator.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.border,
    this.onPressed,
    this.isLoading = false,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? border;
  final Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: border ?? BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: !isLoading
            ? Text(
                text,
                style: Styles.testStyle18.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            : CustomCircleProgressIndicator(
                textColor: textColor,
              ),
      ),
    );
  }
}
