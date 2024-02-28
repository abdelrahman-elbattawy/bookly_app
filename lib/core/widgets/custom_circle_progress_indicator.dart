import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomCircleProgressIndicator extends StatelessWidget {
  const CustomCircleProgressIndicator({
    super.key,
    required this.textColor,
  });

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          color: Colors.white,
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          'Please Wait...',
          style: Styles.testStyle18.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
