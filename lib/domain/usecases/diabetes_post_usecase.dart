import '../entities/diabetes_post_entity.dart';
import '../repository/base_diabetes_repository.dart';

class DiabetesPostUseCase {
  final BaseRepository baseDiabetesRepository;

  DiabetesPostUseCase(this.baseDiabetesRepository);

  Future<String> execute(int? gender, int? age, int? weight, int? polyuria, int? alopecia, int? polydipsia) async {
    return await baseDiabetesRepository.postDiabetesData(gender, age, weight, polyuria, alopecia, polydipsia);
  }
}