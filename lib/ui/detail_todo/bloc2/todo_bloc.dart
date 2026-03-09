import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson02_flutter/bloc1/todo_bloc.dart' hide TodoState, LoadingTodoState, ErrorTodoState, TodoEvent, TodoInitial;
import 'package:lesson02_flutter/data/api_service/todo_api_service.dart';
import 'package:lesson02_flutter/data/model/models/list_todo_model.dart' show ListTodoModel;
import 'package:lesson02_flutter/ui/detail_todo/bloc2/todo_event.dart';
import 'package:lesson02_flutter/ui/detail_todo/bloc2/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this._apiService) : super(TodoInitial()) {
    on<GetAllTodoEvent>(_getAllTodo);
    on<GetTodoByIdEvent>(_getTodoById);
  }

  final TodoApiService _apiService;
  
  var talker;

  Future<void> _getAllTodo(
    GetAllTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(LoadingTodoState());
    try {
      final ListTodoModel listTodoModel = await _apiService.getListTodo();
      emit(LoadedAllTodosState(listTodoModel: listTodoModel));
    } catch (error, stackTrace) {
      talker.handle(exception: error, stackTrace: stackTrace);
      emit(ErrorTodoState());
    }
  }

  Future<void> _getTodoById(
    GetTodoByIdEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(LoadingTodoState());
     try {
      final ListTodoModel listTodoModel = await _apiService.getListTodo();
      emit(LoadedAllTodosState(listTodoModel: listTodoModel));
    } catch (error, stackTrace) {
      talker.handle(exception: error, stackTrace: stackTrace);
      emit(ErrorTodoState());
    }
  }
}
