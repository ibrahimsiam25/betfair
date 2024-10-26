import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:betfair/features/fears/widgets/fears_view_body.dart';
import 'package:flutter/material.dart';

class FearsView extends StatelessWidget {
  const FearsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        body: SafeArea(
      child: FearsViewBody(),
    ));
  }
}
