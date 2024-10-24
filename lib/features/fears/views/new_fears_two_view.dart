import 'package:betfair/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/new_fears_two_view_body.dart';

class NewFearsTwoView extends StatelessWidget {
  const NewFearsTwoView({super.key, required this.fearsMap});
final Map<String , dynamic> fearsMap;
  @override
  Widget build(BuildContext context) {
   
    return  CustomScaffold(body: SafeArea(child: NewFearsTwoViewBody(
      fears: fearsMap[kFears],
      howLong: fearsMap[kHowLong],
    )));
  }
}