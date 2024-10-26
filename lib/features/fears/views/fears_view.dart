import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:betfair/features/fears/manager/fears_cubit.dart';
import 'package:betfair/features/fears/widgets/fears_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FearsView extends StatelessWidget {
  const FearsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(
        body: SafeArea(
            child: BlocProvider(
      create: (context) => FearsCubit()..loadFears(),
      child:const FearsViewBody(),
    )));
  }
}
