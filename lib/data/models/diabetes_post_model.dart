import '../../domain/entities/diabetes_post_entity.dart';

class DiabetesPostModel extends DiabetesPostEntity {
  const DiabetesPostModel({
    required super.gender,
    required super.age,
    required super.weight,
    required super.polyuria,
    required super.alopecia,
    required super.polydipsia,
  });

  Map toJson() => {
    "Polydipsia": polydipsia,
    "Polyuria": polyuria,
    "Gender": gender,
    "Age": age,
    "Sudden_Weight_Loss": weight,
    "Alopecea": alopecia,
  };
}
