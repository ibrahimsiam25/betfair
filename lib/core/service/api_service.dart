import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://rule-draw.site/draw.php';

  Future<Map<String, dynamic>> makePostRequests() async {
    // الطلب الأول
    var response1 = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fair_play_education': 'programs',
        'anti_cheating_measures': 'programs',
        'sportsmanship_awards': 'programs',
      }),
    );

    if (response1.statusCode != 200) {
      return jsonDecode(
          '{"fair_play_education": "Educational programs aimed at promoting fair play and ethics in sports and competitions.", "anti_cheating_measures": "Implementing strict measures to prevent cheating and maintain integrity.", "sportsmanship_awards": "Awards and recognitions for individuals or teams exemplifying exceptional sportsmanship."}');
    }

    // الطلب الثاني
    var response2 = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'ethical_leadership': 'programs',
        'conflict_resolution': 'programs',
        'transparency_initiatives': 'programs',
      }),
    );

    // الطلب الثالث
    var response3 = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fair_competition_policies': 'programs',
        'diversity_inclusion': 'programs',
        'community_outreach': 'programs',
      }),
    );

    return {
      'response1': jsonDecode(response1.body),
      'response2': jsonDecode(response2.body),
      'response3': jsonDecode(response3.body),
    };
  }
}
