import 'dart:io';

import '../repository/base_diabetes_repository.dart';


class UploadBrainTumorUseCase {
  final BaseRepository baseRepository;
  UploadBrainTumorUseCase(this.baseRepository,);

  Future<String> call(File? img) async {
    return await baseRepository.uploadBrainTumor(img);
  }
}