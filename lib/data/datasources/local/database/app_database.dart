import 'dart:async';
import 'package:floor/floor.dart';
import 'package:floor_1/data/model/person.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../dao/person_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Person])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}