import 'package:dio/dio.dart';
import 'package:lesson02_flutter/data/model/models/list_todo_model.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

class TodoApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://dummyjson.com/"));

  TodoApiService() {
    _dio.interceptors.add(TalkerDioLogger());
  }

  Future<ListTodoModel> getListTodo() async {
    final Response response = await _dio.get("todos");
    final ListTodoModel listTodoModel = ListTodoModel.fromJson(response.data);
    return listTodoModel;
  }

  Future<ListTodoModel> getTodo({required int id}) async {
    final Response response = await _dio.get("todos");
    final ListTodoModel listTodoModel = ListTodoModel.fromJson(response.data);
    return listTodoModel;
  }

  Future<TodoModel> updateTodo({
    required int id,
    required bool completed,
  }) async {
    final Response response = await _dio.put(
      "todos/$id",
      data: {'completed ': "completed"},
    );
    return TodoModel.fromJson(response.data);
  }
}
