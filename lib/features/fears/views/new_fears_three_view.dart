import 'package:flutter/material.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/new_fears_three_view_body.dart';

class NewFearsThreeView extends StatelessWidget {
  const NewFearsThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(body: 
      SafeArea(child: NewFearsThreeViewBody()));
  }
}