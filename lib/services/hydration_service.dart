// import 'package:shared_preferences/shared_preferences.dart';

// class HydrationService {
//   static const _hydrationKey = 'hydration';
//   static const _goalKey = 'goal';
//   static const _exerciseDuration = 60; // In minutes
//   static const _minRecommendedHydration = 0.25; // 250 ml

//   Future<double> getHydration() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getDouble(_hydrationKey) ?? 0;
//   }

//   Future<void> setHydration(double hydration) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setDouble(_hydrationKey, hydration);
//   }

//   Future<double> getGoal() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getDouble(_goalKey) ?? 0;
//   }

//   Future<void> setGoal(double goal) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setDouble(_goalKey, goal);
//   }

//   Future<double> calculateRecommendedHydration() async {
//     final goal = await getGoal();
//     final duration = _exerciseDuration.toDouble();
//     const minRecommended = _minRecommendedHydration;

//     final recommendedHydration = ((duration / 60) * minRecommended) + (goal / 1000);
//     return recommendedHydration;
//   }
// }

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:watintake/models/hydration_entry.dart';

// class HydrationService {
//   static const String _apiUrl = 'https://api.example.com/hydration';

//   static Future<List<HydrationEntry>> getHydrationEntries() async {
//     final response = await http.get(Uri.parse(_apiUrl));
//     if (response.statusCode == 200) {
//       final List<dynamic> entriesJson = json.decode(response.body);
//       final entries = entriesJson.map((json) => HydrationEntry.fromMap(json)).toList();
//       return entries;
//     } else {
//       throw Exception('Failed to load hydration entries');
//     }
//   }

//   static Future<void> addHydrationEntry(HydrationEntry entry) async {
//     final headers = <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     };
//     final jsonBody = json.encode(entry.toMap());
//     final response = await http.post(Uri.parse(_apiUrl), headers: headers, body: jsonBody);
//     if (response.statusCode != 201) {
//       throw Exception('Failed to add hydration entry');
//     }
//   }
// }


//2nd one
// import 'dart:convert';
// // ignore: depend_on_referenced_packages
// import 'package:http/http.dart' as http;
// import '../models/hydration_entry.dart';

// class HydrationService {
//   final String _baseUrl = 'https://example.com/api'; // Replace with your API URL

//   Future<List<HydrationEntry>> getHydrationEntries() async {
//     final response = await http.get(Uri.parse('$_baseUrl/hydration_entries'));

//     if (response.statusCode == 200) {
//       final List<dynamic> decodedJson = json.decode(response.body);
//       return decodedJson.map((entry) => HydrationEntry.fromMap(entry)).toList();
//     } else {
//       throw Exception('Failed to load hydration entries');
//     }
//   }

//   Future<void> addHydrationEntry(HydrationEntry entry) async {
//     final response = await http.post(
//       Uri.parse('$_baseUrl/hydration_entries'),
//       headers: <String, String>{'Content-Type': 'application/json'},
//       body: jsonEncode(entry.toMap()),
//     );

//     if (response.statusCode != 201) {
//       throw Exception('Failed to add hydration entry');
//     }
//   }

//   Future<void> deleteHydrationEntry(HydrationEntry entry) async {
//     final response = await http.delete(Uri.parse('$_baseUrl/hydration_entries/${entry.id}'));

//     if (response.statusCode != 204) {
//       throw Exception('Failed to delete hydration entry');
//     }
//   }
// }

//3rd one

// import 'dart:convert';
// // ignore: depend_on_referenced_packages
// import 'package:http/http.dart' as http;
// import '../models/hydration_entry.dart';
// import '../models/user.dart';

// class HydrationService {
//   final String _baseUrl = 'https://example.com/api'; // Replace with your API URL
//   final User user;

//   HydrationService({required this.user});

//   Future<List<HydrationEntry>> getHydrationEntries() async {
//     final response = await http.get(Uri.parse('$_baseUrl/hydration_entries'));

//     if (response.statusCode == 200) {
//       final List<dynamic> decodedJson = json.decode(response.body);
//       return decodedJson.map((entry) => HydrationEntry.fromMap(entry)).toList();
//     } else {
//       throw Exception('Failed to load hydration entries');
//     }
//   }

//   Future<void> addHydrationEntry(HydrationEntry entry) async {
//     final response = await http.post(
//       Uri.parse('$_baseUrl/hydration_entries'),
//       headers: <String, String>{'Content-Type': 'application/json'},
//       body: jsonEncode(entry.toMap()),
//     );

//     if (response.statusCode != 201) {
//       throw Exception('Failed to add hydration entry');
//     }
//   }

//   Future<void> deleteHydrationEntry(HydrationEntry entry) async {
//     final response = await http.delete(Uri.parse('$_baseUrl/hydration_entries/${entry.id}'));

//     if (response.statusCode != 204) {
//       throw Exception('Failed to delete hydration entry');
//     }
//   }

//   int getHydrationGoal() {
//     if (user.gender == Gender.male) {
//       return 3700;
//     } else {
//       return 2700;
//     }
//   }
// }


//'th 

import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watintake/services/storage_service.dart';
import '../models/hydration_entry.dart';
import '../models/user.dart';

class HydrationService {
  final String _baseUrl = 'https://example.com/api'; // Replace with real API URL
  final User? user;

  HydrationService({this.user});

  // Future<List<HydrationEntry>> getHydrationEntries() async {
  //   final response = await http.get(Uri.parse('$_baseUrl/hydration_entries'));

  //   if (response.statusCode == 200) {
  //     final List<dynamic> decodedJson = json.decode(response.body);
  //     return decodedJson.map((entry) => HydrationEntry.fromMap(entry)).toList();
  //   } else {
  //     throw Exception('Failed to load hydration entries');
  //   }
  // }
  Future<List<HydrationEntry>> getHydrationEntries() async {
  final preferences = await SharedPreferences.getInstance();
  final jsonList = preferences.getStringList(StorageService.hydrationEntriesKey);
  if (jsonList == null) {
    return [];
  }
  return jsonList.map((json) => HydrationEntry.fromJson(jsonDecode(json))).toList();
}


  Future<void> addHydrationEntry(HydrationEntry entry) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/hydration_entries'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(entry.toMap()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add hydration entry');
    }
  }

  Future<void> deleteHydrationEntry(HydrationEntry entry) async {
    final response = await http.delete(Uri.parse('$_baseUrl/hydration_entries/${entry.id}'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete hydration entry');
    }
  }

  int getHydrationGoal() {
    // ignore: unrelated_type_equality_checks
    if (user?.gender == Gender.male) {
      return 3000;
    } else {
      return 2500;
    }
  }
}