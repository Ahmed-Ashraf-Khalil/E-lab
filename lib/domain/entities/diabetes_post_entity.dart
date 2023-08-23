import 'package:equatable/equatable.dart';

class DiabetesPostEntity extends Equatable {
  final int gender;
  final int age;
  final int weight;
  final int polyuria;
  final int alopecia;
  final int polydipsia;

  const DiabetesPostEntity({
    required this.gender,
    required this.age,
    required this.weight,
    required this.polyuria,
    required this.alopecia,
    required this.polydipsia,
  });

  @override
  List<Object> get props => [
        gender,
        age,
        weight,
        polyuria,
        polydipsia,
        alopecia,
      ];
}
