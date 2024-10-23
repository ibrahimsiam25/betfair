import 'package:betfair/core/constants/app_assets.dart';

class OnBoardingModel {
  final String picture;
  final String title;

  OnBoardingModel({required this.picture, required this.title});
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(picture: Assets.imagesOnBoarding1, title: 'Fear what a cool app'),
  OnBoardingModel(picture: Assets.imagesOnBoarding2, title: 'Look your fear in the eye and overcome it with us'),
];