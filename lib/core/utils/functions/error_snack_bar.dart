import 'package:flutter/material.dart';

void errorSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
