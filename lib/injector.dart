import 'package:floor_1/data/datasources/local/dao/person_dao.dart';
import 'package:floor_1/data/datasources/local/database/app_database.dart';
import 'package:floor_1/data/repositories/person_repository_impl.dart';
import 'package:floor_1/domain/repositories/person_repository.dart';
import 'package:floor_1/domain/usecase/add_person_usecase.dart';
import 'package:floor_1/domain/usecase/delete_all_persons_usecase.dart';
import 'package:floor_1/domain/usecase/get_all_persons_usecase.dart';
import 'package:floor_1/presentation/bloc/first_screen_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

Future<void> injectDependencies() async {

  ///floor db
  injector.registerSingletonAsync<AppDatabase>(() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return database;
  });
  //it's just for the purpose of AppDatabase getting initialized before we try to access it
  await injector.isReady<AppDatabase>();
  injector.registerSingleton<PersonDao>(injector<AppDatabase>().personDao);

  ///repository
  injector.registerSingleton<PersonRepositoryImpl>(PersonRepositoryImpl(injector<PersonDao>()));
  injector.registerSingleton<PersonRepository>(injector<PersonRepositoryImpl>());

  ///usecases
  injector.registerSingleton<GetAllPersonsUsecase>(GetAllPersonsUsecase(injector<PersonRepository>()));
  injector.registerSingleton<AddPersonUsecase>(AddPersonUsecase(injector<PersonRepository>()));
  injector.registerSingleton<DeleteAllPersonsUsecase>(DeleteAllPersonsUsecase(injector<PersonRepository>()));

  ///bloc
  injector.registerSingleton<FirstScreenBloc>(
    FirstScreenBloc(
      injector<AddPersonUsecase>(),
      injector<GetAllPersonsUsecase>(),
      injector<DeleteAllPersonsUsecase>(),
    ),
  );
}
