import '../../data/model/person.dart';
import '../repositories/person_repository.dart';

class AddPersonUsecase {
  final PersonRepository _personRepository;

  AddPersonUsecase(this._personRepository);

  Future<void> call(Person person) {
    return _personRepository.addPerson(person);
  }
}