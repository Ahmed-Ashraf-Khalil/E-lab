import '../../domain/entities/diabetes_get_entity.dart';

class DiabetesGetModel extends DiabetesGetEntity {
  const DiabetesGetModel({required super.result});

  factory DiabetesGetModel.fromJson(Map<String, dynamic> json) => DiabetesGetModel(
    result: json['result'],
  );

}