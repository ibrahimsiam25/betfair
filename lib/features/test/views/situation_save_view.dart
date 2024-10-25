import 'package:flutter/material.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/situation_save_view_body.dart';

class SituationSaveView extends StatelessWidget {
  const SituationSaveView({super.key, required this.rateOfSituation});
final List<int> rateOfSituation;
  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(body: SafeArea(child: SituationSaveViewBody(

      rateOfSituation: rateOfSituation
    )));
  }
}