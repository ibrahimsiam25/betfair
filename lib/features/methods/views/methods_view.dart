import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../widgets/methods_view_body.dart';

class MethodsView extends StatelessWidget {
  const MethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SafeArea(
        child: MethodsViewBody(),
      ),
    );
  }
}
