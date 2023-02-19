// class Hydration {
//   final int id;
//   final DateTime date;
//   final int amount;

//   Hydration({required this.id, required this.date, required this.amount});
// }

// class Hydration {
//   final int amount;
//   final String unit;

//   Hydration({
//     required this.amount,
//     required this.unit,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'amount': amount,
//       'unit': unit,
//     };
//   }

//   static Hydration fromMap(Map<String, dynamic> map) {
//     return Hydration(
//       amount: map['amount'],
//       unit: map['unit'],
//     );
//   }
// }

// class Hydration {
//   final int id;
//   final int goal;
//   final int currentIntake;

//   Hydration({
//     required this.id,
//     required this.goal,
//     required this.currentIntake,
//   });

//   factory Hydration.fromJson(Map<String, dynamic> json) {
//     return Hydration(
//       id: json['id'],
//       goal: json['goal'],
//       currentIntake: json['currentIntake'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'goal': goal,
//       'currentIntake': currentIntake,
//     };
//   }
// }


//3rd one

class Hydration {
  final int amount;
  final String unit;

  Hydration({required this.amount, required this.unit});

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'unit': unit,
    };
  }

  static Hydration fromMap(Map<String, dynamic> map) {
    return Hydration(
      amount: map['amount'] ?? 0,
      unit: map['unit'] ?? '',
    );
  }
}
