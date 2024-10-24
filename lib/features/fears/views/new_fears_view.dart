import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../widgets/new_fears_view_body.dart';

class NewFearsView extends StatelessWidget {
  const NewFearsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(body: 
      SafeArea(child: NewFearsViewBody()));
  }
}