// import 'package:watintake/models/hydration.dart';

// class HydrationEntry {
//   final int? id;
//   final DateTime date;
//   final Hydration hydration;

//   HydrationEntry({
//     this.id,
//     required this.date,
//     required this.hydration,
//   });

//   String get displayDate {
//     final day = date.day.toString().padLeft(2, '0');
//     final month = date.month.toString().padLeft(2, '0');
//     final year = date.year.toString();

//     return '$day/$month/$year';
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'date': date.toIso8601String(),
//       'hydration': hydration.toMap(),
//     };
//   }

//   static HydrationEntry fromMap(Map<String, dynamic> map) {
//     return HydrationEntry(
//       id: map['id'],
//       date: DateTime.parse(map['date']),
//       hydration: Hydration.fromMap(map['hydration']),
//     );
//   }
// }

//2nd code
import 'dart:convert';

import 'package:watintake/models/hydration.dart';

class HydrationEntry {
  final int? id;
  final DateTime date;
  final Hydration hydration;

  HydrationEntry({
    this.id,
    required this.date,
    required this.hydration,
  });

  String get displayDate {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    return '$day/$month/$year';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'hydration': hydration.toMap(),
    };
  }

  static HydrationEntry fromMap(Map<String, dynamic> map) {
    return HydrationEntry(
      id: map['id'],
      date: DateTime.parse(map['date']),
      hydration: Hydration.fromMap(map['hydration']),
    );
  }
    static HydrationEntry fromJson(String jsonString) {
    final Map<String, dynamic> map = json.decode(jsonString);
    return fromMap(map);
  }

  Map<String, dynamic> toJson() => toMap();

  String toJsonString() => json.encode(toJson());
}
