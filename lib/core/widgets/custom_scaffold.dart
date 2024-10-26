import 'package:flutter/material.dart';

import '../constants/app_assets.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
  });
  final Widget body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                Assets.imagesBackground), // Replace with your image path
            fit: BoxFit.cover, // Use BoxFit.cover to cover the entire container
          ),
        ),
        child: body,
      ),
    );
  }
}
