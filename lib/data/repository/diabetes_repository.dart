
import 'dart:io';

import '../../domain/repository/base_diabetes_repository.dart';
import '../datasource/diabetes_remote_data_source.dart';
import '../models/diabetes_post_model.dart';

class ElabRepo extends BaseRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  ElabRepo({required this.baseRemoteDataSource});

  @override
  Future<String> getDiabetesResult() async{
    return await baseRemoteDataSource.diabetesGetResult();
  }

  @override
  Future<String> postDiabetesData(int? gender, int? age, int? weight, int? polyuria, int? alopecia, int? polydipsia) async{
    return await baseRemoteDataSource.diabetesPostData(gender, age, weight, polyuria, alopecia, polydipsia);
  }

  @override
  Future<String> uploadSkinCancer(File? img) async {
    return await baseRemoteDataSource.uploadSkinCancer(img);
  }

  @override
  Future<String> uploadBrainTumor(File? img) async {
    return await baseRemoteDataSource.uploadBrainTumor(img);
  }

  @override
  Future<String> uploadChest(File? img) async {
    return await baseRemoteDataSource.uploadChest(img);
  }

}