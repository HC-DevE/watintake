// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:watintake/models/hydration_entry.dart';

// class StorageService {
//   static const _hydrationEntriesKey = 'hydration_entries';

//   Future<List<HydrationEntry>> loadEntries() async {
//     final prefs = await SharedPreferences.getInstance();
//     final jsonEntries = prefs.getString(_hydrationEntriesKey) ?? '[]';
//     return jsonDecode(jsonEntries)
//         .map<HydrationEntry>((json) => HydrationEntry.fromJson(json))
//         .toList();
//   }

//   Future<void> saveEntry(HydrationEntry entry) async {
//     final prefs = await SharedPreferences.getInstance();
//     final entries = await loadEntries();
//     entries.add(entry);
//     final jsonEntries = jsonEncode(entries.map((entry) => entry.toJson()).toList());
//     prefs.setString(_hydrationEntriesKey, jsonEntries);
//   }
// }

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:watintake/models/hydration_entry.dart';

class StorageService {
  static const hydrationEntriesKey = 'hydration_entries';

  Future<List<HydrationEntry>> getHydrationEntries() async {
    final preferences = await SharedPreferences.getInstance();
    final jsonList = preferences.getStringList(hydrationEntriesKey);
    if (jsonList == null) {
      return [];
    }
    return jsonList.map((json) => HydrationEntry.fromJson(jsonDecode(json))).toList();
  }

  Future<void> saveHydrationEntry(HydrationEntry entry) async {
    final preferences = await SharedPreferences.getInstance();
    final entries = await getHydrationEntries();
    entries.add(entry);
    await preferences.setStringList(hydrationEntriesKey, entries.map((entry) => jsonEncode(entry.toJson())).toList());
  }
}
