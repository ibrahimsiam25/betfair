import 'package:betfair/core/models/fears_model.dart';
import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:betfair/features/edit_fear/widgets/edit_fear_view_body.dart';
import 'package:flutter/material.dart';

class EditFearView extends StatelessWidget {
  const EditFearView({super.key, required this.fearModel});
final FearModel fearModel ;
  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(
      body: EditFearViewBody(
        fearModel: fearModel,
      ),
    );
  }
}
