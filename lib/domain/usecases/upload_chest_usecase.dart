import 'dart:io';

import '../repository/base_diabetes_repository.dart';


class UploadChestUseCase {

  final BaseRepository baseRepository;
  UploadChestUseCase( this.baseRepository);

  Future<String> call(File? img) async {
    return await baseRepository.uploadChest(img);
  }
}