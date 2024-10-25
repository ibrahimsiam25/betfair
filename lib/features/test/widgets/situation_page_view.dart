import 'package:betfair/features/test/widgets/situation_page.dart';
import 'package:flutter/material.dart';

import '../data/static/situation_data.dart';

class SituationPageView extends StatelessWidget {
  final PageController pageController;
  final ValueChanged<int> onPageChanged;
  final List<int> rateOfSituation;

  const SituationPageView({
    Key? key,
    required this.pageController,
    required this.onPageChanged,
    required this.rateOfSituation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: PageView.builder(
        controller: pageController,
        itemCount: situationData.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return SituationPage(
            index: index,
            rateOfSituation: rateOfSituation,
          );
        },
      ),
    );
  }
}
