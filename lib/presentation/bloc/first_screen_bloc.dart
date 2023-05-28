import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/model/person.dart';
import '../../domain/usecase/add_person_usecase.dart';
import '../../domain/usecase/delete_all_persons_usecase.dart';
import '../../domain/usecase/get_all_persons_usecase.dart';

part 'first_screen_event.dart';

part 'first_screen_state.dart';

class FirstScreenBloc extends Bloc<FirstScreenEvent, FirstScreenState> {
  final TextEditingController textEditingController = TextEditingController();

  final AddPersonUsecase _addPersonUsecase;
  final GetAllPersonsUsecase _getAllPersonsUsecase;
  final DeleteAllPersonsUsecase _deleteAllPersonsUsecase;

  FirstScreenBloc(this._addPersonUsecase, this._getAllPersonsUsecase, this._deleteAllPersonsUsecase) : super(const FirstScreenInitial(null)) {
    on<AddPersonEvent>(_onAddPerson);
    on<GetAllPersonsEvent>(_getAllPersons);
    add(GetAllPersonsEvent());

    on<DeleteAllPersonsEvent>(_deleteAllPersons);
  }

  void _onAddPerson(AddPersonEvent event, Emitter<FirstScreenState> emitter) async {
    await _addPersonUsecase.call(Person(name: event.name));
  }

  void _getAllPersons(GetAllPersonsEvent event, Emitter<FirstScreenState> emitter) async {
    List<Person?> persons = [];
    persons = await _getAllPersonsUsecase.call();
    emitter(FirstScreenInitial(persons));
  }

  void _deleteAllPersons(DeleteAllPersonsEvent event, Emitter<FirstScreenState> emitter) async{
    await _deleteAllPersonsUsecase.call();
    emitter(const FirstScreenInitial(<Person?>[]));
  }
}
