import 'package:flutter/material.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/test_view_body.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(body: TestViewBody());
  }
}