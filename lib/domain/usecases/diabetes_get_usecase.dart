
import '../repository/base_diabetes_repository.dart';

class DiabetesGetUseCase {
  final BaseRepository baseDiabetesRepository;

  DiabetesGetUseCase(this.baseDiabetesRepository);

  Future<String> execute() async {
    return await baseDiabetesRepository.getDiabetesResult();
  }
}
