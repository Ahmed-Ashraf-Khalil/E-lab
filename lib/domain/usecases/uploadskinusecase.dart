import 'dart:io';

import '../repository/base_diabetes_repository.dart';


class UploadSkinUseCase {

  final BaseRepository baseRepository;
  UploadSkinUseCase(this.baseRepository);

  Future<String> call(File? img) async {
    return await baseRepository.uploadSkinCancer(img);
  }
}