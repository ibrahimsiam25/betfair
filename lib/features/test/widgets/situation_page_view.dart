import 'package:betfair/features/test/widgets/situation_page.dart';
import 'package:flutter/material.dart';

import '../data/static/situation_data.dart';

class SituationPageView extends StatelessWidget {
  final PageController pageController;
  final ValueChanged<int> onPageChanged;
  final List<int> rateOfSituation;

  const SituationPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
    required this.rateOfSituation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.58,
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
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
