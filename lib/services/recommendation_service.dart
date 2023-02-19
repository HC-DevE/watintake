import 'dart:convert';
import '../models/recommendation.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  final String _baseUrl = 'https://swapi.dev/api/';
 // Replace with your API URL

  Future<Recommendation> getRecommendation({
    int? age,
    Gender? gender,
    double? weight,
    double? height,
  }) async {
    final response = await http.get(Uri.parse('$_baseUrl/people'));

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return Recommendation.fromMap(decodedJson);
    } else {
      throw Exception('Failed to load recommendation');
    }
  }

  Future<int> getDailyIntake(
      {required int age,
      required Gender gender,
      required double weight,
      required double height}) async {
    final recommendation = await getRecommendation(
        age: age, gender: gender, weight: weight, height: height);
    final dailyIntake = recommendation.dailyIntake;

    return dailyIntake;
  }
}
