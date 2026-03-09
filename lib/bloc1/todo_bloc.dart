import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lesson02_flutter/data/api_service/todo_api_service.dart';
import 'package:lesson02_flutter/data/model/models/list_todo_model.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this._api) : super(TodoInitial()) {
    on<GetAllTodosEvent>((_getAllTodos));
    on<GetDeteilTodoEvent>((_getDeteilTodo));
    on<UpdateTodoEvent>((_updateTodo));
  }

  final TodoApiService _api;

  Future<void> _updateTodo(
    UpdateTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await _api.updateTodo(id: event.id, completed: event.completed);
      add(GetAllTodosEvent());
    } catch (e) {
      emit(ErrorTodoState());
    }
  }

  Future<void> _getAllTodos(
    GetAllTodosEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(LoadingTodoState());
    try {
      final ListTodoModel listTodoModel = await _api.getListTodo();
      emit(LoadedAllTodoState(todoModel: listTodoModel));
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    }
  }

  Future<void> _getDeteilTodo(
    GetDeteilTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(LoadingTodoState());
    try {
      final ListTodoModel listTodoModel = await _api.getTodo(id: event.id);
      emit(LoadedDeteilTodoState(todo: listTodoModel));
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    }
  }
}