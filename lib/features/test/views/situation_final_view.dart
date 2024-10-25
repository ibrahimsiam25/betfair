import 'package:flutter/material.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/situation_final_view_body.dart';

class SituationFinalView extends StatelessWidget {
  const SituationFinalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(body: SafeArea(child: SituationFinalViewBody()));
  }
}