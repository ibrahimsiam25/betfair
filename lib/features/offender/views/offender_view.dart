import 'package:flutter/material.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/offender_view_body.dart';

class OffenderView extends StatelessWidget {
  const OffenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: OffenderViewBody(),
    );
  }
}
