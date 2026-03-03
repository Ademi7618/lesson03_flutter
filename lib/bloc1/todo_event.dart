part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

final class GetAllTodosEvent extends TodoEvent {}

final class GetDeteilTodoEvent extends TodoEvent {
  const GetDeteilTodoEvent({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}

final class UpdateTodoEvent extends TodoEvent {
  const UpdateTodoEvent({required this.id, required this.completed});
  final int id;
  final bool completed;

  @override
  List<Object> get props => [id, completed];
}