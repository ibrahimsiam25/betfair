import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:betfair/features/settings/widgets/settings_view_body.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SettingsViewBody(),
    );
  }
}
