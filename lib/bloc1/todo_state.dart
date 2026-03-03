part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

final class LoadingTodoState extends TodoState {}

final class ErrorTodoState extends TodoState {}

final class LoadedAllTodoState extends TodoState {
  const LoadedAllTodoState({required this.listTodoModel});
  final ListTodoModel listTodoModel;
  List<Object> get props => [listTodoModel];

}

final class LoadedDeteilTodoState extends TodoState{
  const LoadedDeteilTodoState({required this.todo});
  final ListTodoModel todo;


  @override
  List<Object> get props => [todo];
}