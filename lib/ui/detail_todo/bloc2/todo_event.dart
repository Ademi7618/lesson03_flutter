import 'package:equatable/equatable.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

final class GetAllTodoEvent extends TodoEvent {}

final class GetTodoByIdEvent extends TodoEvent {
  GetTodoByIdEvent({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
