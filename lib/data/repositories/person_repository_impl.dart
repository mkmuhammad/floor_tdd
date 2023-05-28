import '../../domain/repositories/person_repository.dart';
import '../datasources/local/dao/person_dao.dart';
import '../model/person.dart';


///here we we should decide whether to retrieve data from local or remote datasource;
class PersonRepositoryImpl implements PersonRepository {
  final PersonDao _personDao;

  PersonRepositoryImpl(this._personDao);

  @override
  Future<List<Person?>> getAllPersons() => _personDao.findAllPersons();

  @override
  Future<Person?> getPersonById(int id) => _personDao.findPersonById(id);

  @override
  Future<void> addPerson(Person person) => _personDao.insertPerson(person);

  @override
  Future<void> updatePerson(Person person) => _personDao.updatePerson(person);

  @override
  Future<void> deletePerson(Person person) => _personDao.deletePerson(person);

  @override
  Future<void> deleteAll() => _personDao.deleteAll();
}