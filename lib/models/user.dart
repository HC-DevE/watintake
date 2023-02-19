class User {
  final String name;
  final int age;
  final String gender;
  final int weight;

  User({required this.name, required this.age, required this.gender, required this.weight});
}
enum Gender {
  male,
  female,
}

extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
    }
  }
}