import '../repositories/person_repository.dart';

class DeleteAllPersonsUsecase {
  final PersonRepository _personRepository;

  DeleteAllPersonsUsecase(this._personRepository);

  Future<void> call() {
    return _personRepository.deleteAll();
  }
}