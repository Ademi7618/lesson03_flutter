import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson02_flutter/bloc1/todo_bloc.dart';
import 'package:lesson02_flutter/data/api_service/todo_api_service.dart';
import 'package:lesson02_flutter/ui/detail_todo/detail_todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc(TodoApiService())..add(GetAllTodosEvent()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoBloc>();

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is LoadedAllTodoState) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: state.todoModel.todos.length,
                itemBuilder: (context, index) {
                  final todo = state.todoModel.todos[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailTodoPage(todoId: todo.id),
                        ),
                      );
                    },
                    onLongPress: () {
                      bloc.add(
                        UpdateTodoEvent(
                          id: todo.id,
                          completed: !todo.completed,
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            todo.todo,
                            style: TextStyle(
                              decoration: todo.completed
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                        ),
                        Checkbox(
                          value: todo.completed,
                          onChanged: (value) {
                            bloc.add(
                              UpdateTodoEvent(
                                id: todo.id,
                                completed: value ?? false,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            if (state is ErrorTodoState) {
              return const Center(child: Text('Ошибка'));
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}