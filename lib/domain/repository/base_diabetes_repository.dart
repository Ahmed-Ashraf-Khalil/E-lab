import 'dart:io';

abstract class BaseRepository {
  Future<String> getDiabetesResult();

  Future<String> postDiabetesData(int? gender, int? age, int? weight, int? polyuria, int? alopecia, int? polydipsia);

  Future<String> uploadSkinCancer(File? img);

  Future<String> uploadBrainTumor(File? img);

  Future<String> uploadChest(File? img);
}