import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButtonCircleIndicator extends StatelessWidget {
  const CustomButtonCircleIndicator({
    super.key,
    required this.textColor,
  });

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 28,
          width: 28,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
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
