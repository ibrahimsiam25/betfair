import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../widgets/situation_view_body.dart';

class SituationView extends StatelessWidget {
  const SituationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(body: 
    SafeArea(child: SituationViewBody())
    );
  }
}