class Recommendation {
  final int dailyIntake;

  Recommendation({
    required this.dailyIntake,
  });

  factory Recommendation.fromMap(Map<String, dynamic> map) {
    return Recommendation(
      dailyIntake: map['daily_intake'],
    );
  }
}
