import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'person')
class Person extends Equatable{
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;

  const Person({this.id,required this.name});

  @override
  List<Object?> get props => [id, name];
}