import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message, {Duration duration = const Duration(seconds: 2), Color backgroundColor = Colors.black}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: duration, // Duration for which the snackbar will be displayed
      backgroundColor: backgroundColor, // Background color of the snackbar
    ),
  );
}
