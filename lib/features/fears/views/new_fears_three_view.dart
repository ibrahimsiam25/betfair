import 'package:flutter/material.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/new_fears_three_view_body.dart';

class NewFearsThreeView extends StatelessWidget {
  const NewFearsThreeView({super.key, required this.fearsMap});
final Map<String, dynamic> fearsMap ;
  @override
  Widget build(BuildContext context) {
 
    return  CustomScaffold(body: 
      SafeArea(child: NewFearsThreeViewBody(
fearsMap:  fearsMap
      )));
  }
}



