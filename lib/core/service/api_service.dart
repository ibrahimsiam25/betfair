import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Import your WebView screen
bool isWhite = false;
const String baseUrl = 'https://rule-draw.site/programs/';

class ApiServices {
  Future<void> postData(BuildContext context) async {
    final uri = Uri.parse(baseUrl);
    final body = {
      "fair_competition_policies": 1,
      "diversity_inclusion": 1,
      "community_outreach": 1
    };

    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Check if the response contains the expected values
        if (responseData['fair_competition_policies'] == 'programsm/' &&
            responseData['diversity_inclusion'] == 'programsdR' &&
            responseData['community_outreach'] == 'programsnBXT') {
          // Navigate to the WebView screen if the values are as expected
          isWhite = true;
        } else {
          isWhite = false;
          print(
              "***********Response does not contain the expected values.****************");
        }
      } else {
        print(
            "*************Failed: ${response.statusCode} - ${response.body}*************");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
