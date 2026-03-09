import 'package:equatable/equatable.dart';
import 'package:lesson02_flutter/data/model/models/list_todo_model.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

final class TodoInitial extends TodoState {}

final class LoadingTodoState extends TodoState {}
 
final class LoadedTodoState extends TodoState {
  const LoadedTodoState({required this.todoModel});

  final TodoModel todoModel;

  @override
  List<Object?> get props => [todoModel];
}

final class ErrorTodoState extends TodoState {}

final class LoadedAllTodosState extends TodoState {
  const LoadedAllTodosState({required this.listTodoModel});

  final ListTodoModel listTodoModel;

  @override
  List<Object?> get props => [listTodoModel];
}