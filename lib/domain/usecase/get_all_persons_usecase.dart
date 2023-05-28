import '../../data/model/person.dart';
import '../repositories/person_repository.dart';

class GetAllPersonsUsecase {
  final PersonRepository _personRepository;

  GetAllPersonsUsecase(this._personRepository);

  Future<List<Person?>> call() {
    return _personRepository.getAllPersons();
  }
}