import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

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
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_sharp,
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
