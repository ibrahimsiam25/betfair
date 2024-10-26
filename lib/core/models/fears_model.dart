import '../constants/app_constants.dart';

class FearModel {
  final String fears;
  final String howLong;
  final String date;
  final String controlMethods; 
  final int rateLevelFear;

  FearModel({
    required this.fears,
    required this.howLong,
    required this.date,
    required this.controlMethods,
    required this.rateLevelFear,
  });


  Map<String, dynamic> toMap() {
    return {
     kFears: fears,
      kHowLong: howLong,
      kDate: date,
      kControlMethods: controlMethods,
      kRateLevelFear: rateLevelFear,
    };
  }

 
  factory FearModel.fromMap(Map<String, dynamic> map) {
    return FearModel(
      fears: map[kFears],
      howLong: map[kHowLong],
      date: map[kDate],
      controlMethods: map[kControlMethods],
      rateLevelFear: map[kRateLevelFear],
    );
  }
}
