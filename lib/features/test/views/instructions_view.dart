import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../widgets/instructions_view_body.dart';

class InstructionsView extends StatelessWidget {
  const InstructionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(body: 
    SafeArea(child: 
    InstructionsViewBody())
    );
  }
}