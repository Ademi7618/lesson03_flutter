import 'package:equatable/equatable.dart';

class ListTodoModel extends Equatable{
  const ListTodoModel({required this.todos});
  
  final List<TodoModel> todos;

  factory ListTodoModel.fromJson(Map<String, dynamic> json){
    List<TodoModel> todoList = [];
    for(var item in json["todos"]){
      todoList.add(TodoModel.fromJson(item));
    }
    return ListTodoModel(todos: todoList);
  }


  @override
  List<Object?> get props => [todos];

  get userId => null;

}

class TodoModel extends Equatable{
  const TodoModel({required this.todo, required this.id, required this.completed, required this.userId});

  final String todo;
  final int id;
  final bool completed;
  final int userId;

  factory TodoModel.fromJson(Map<String, dynamic> json){
    return TodoModel(
      todo: json["todo"],
      id: json["id"], 
      completed: json["completed"],
      userId: json["userId"]
      );
  }

  @override
  List<Object?> get props => [todo, id, completed, userId];
  
}