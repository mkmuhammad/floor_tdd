import 'package:floor/floor.dart';

import '../../../model/person.dart';

///each time we change dao we must run: flutter packages pub run build_runner build
@dao
abstract class PersonDao {
  @Query('SELECT * FROM person')
  Future<List<Person?>> findAllPersons();

  @Query('SELECT * FROM person WHERE id = :id')
  Future<Person?> findPersonById(int id);

  @insert
  Future<void> insertPerson(Person person);

  @update
  Future<void> updatePerson(Person person);

  @delete
  Future<void> deletePerson(Person person);

  @Query('Delete from person')
  Future<void>deleteAll();
}