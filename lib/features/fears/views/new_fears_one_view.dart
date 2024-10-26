import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../widgets/new_fears_one_view_body.dart';

class NewFearsOneView extends StatelessWidget {
  const NewFearsOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: NewFearsViewBody(),
    );
  }
}
