import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailAppBar extends StatelessWidget {
  const BookDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 25,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
