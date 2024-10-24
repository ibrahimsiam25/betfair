import 'package:flutter/material.dart';

import '../constants/app_assets.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
  });
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
