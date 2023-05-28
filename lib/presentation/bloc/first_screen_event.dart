part of 'first_screen_bloc.dart';

abstract class FirstScreenEvent extends Equatable {
  const FirstScreenEvent();
}

class AddPersonEvent extends FirstScreenEvent {
  final String name;

  const AddPersonEvent(this.name);

  @override
  List<Object?> get props => [];
}

class GetAllPersonsEvent extends FirstScreenEvent{
  @override
  List<Object?> get props => [];

}

class DeleteAllPersonsEvent extends FirstScreenEvent{
  @override
  List<Object?> get props => [];


}
