part of 'first_screen_bloc.dart';

abstract class FirstScreenState extends Equatable {
  const FirstScreenState();
}

class FirstScreenInitial extends FirstScreenState {
  final List<Person?>? persons;

  const FirstScreenInitial(this.persons);

  @override
  List<Object?> get props => [persons];
}
