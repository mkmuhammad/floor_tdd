import '../../data/model/person.dart';

abstract class PersonRepository {
  Future<List<Person?>> getAllPersons();

  Future<Person?> getPersonById(int id);

  Future<void> addPerson(Person person);

  Future<void> updatePerson(Person person);

  Future<void> deletePerson(Person person);

  Future<void> deleteAll();
}
