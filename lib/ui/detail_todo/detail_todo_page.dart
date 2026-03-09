import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson02_flutter/bloc1/todo_bloc.dart';
import 'package:lesson02_flutter/data/api_service/todo_api_service.dart';
import 'package:lesson02_flutter/ui/detail_todo/bloc2/todo_event.dart'
    hide TodoEvent;

class DetailTodoPage extends StatefulWidget {
  const DetailTodoPage({super.key, required this.todoId});

  final int todoId;

  @override
  State<DetailTodoPage> createState() => _DetailTodoPageState();
}

class _DetailTodoPageState extends State<DetailTodoPage> {
  final TodoBloc _todoBloc = TodoBloc(TodoApiService());

  @override
  void initState() {
    _todoBloc.add(GetTodoByIdEvent(id: widget.todoId) as TodoEvent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<TodoBloc, TodoState>(
          bloc: _todoBloc,
          builder: (context, state){
             if (state is LoadedAllTodoState) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.todoModel.todos[0].todo),
                    Text(state.todoModel.todos[0].completed.toString()),
                  ],
                ),
              );
            }
            if (state is ErrorTodoState){
              return Text("Ошибка");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        ),
      ),
    );
  }
}
