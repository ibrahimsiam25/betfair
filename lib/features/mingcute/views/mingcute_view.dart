import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../widgets/mingcute_view_body.dart';

class MingcuteView extends StatelessWidget {
  const MingcuteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SafeArea(
        child: MingcuteViewBody(),
        ),
        );
  }
}
