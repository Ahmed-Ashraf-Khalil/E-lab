
import 'package:get_it/get_it.dart';

import '../../data/datasource/diabetes_remote_data_source.dart';
import '../../data/repository/diabetes_repository.dart';
import '../../domain/repository/base_diabetes_repository.dart';
import '../../domain/usecases/diabetes_get_usecase.dart';
import '../../domain/usecases/diabetes_post_usecase.dart';
import '../../domain/usecases/upload_braintumor_usecase.dart';
import '../../domain/usecases/upload_chest_usecase.dart';
import '../../domain/usecases/uploadskinusecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void setup() {
    ///use cases
    sl.registerLazySingleton(() => DiabetesPostUseCase(sl()));
    sl.registerLazySingleton(() => DiabetesGetUseCase(sl()));
    sl.registerLazySingleton(() => UploadSkinUseCase(sl()));
    sl.registerLazySingleton(() => UploadBrainTumorUseCase(sl()));
    sl.registerLazySingleton(() => UploadChestUseCase(sl()));
    ///base repository
    sl.registerLazySingleton<BaseRepository>(() => ElabRepo(baseRemoteDataSource: sl()));
    ///remote data source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => ElabRemoteDataSource());
  }
}