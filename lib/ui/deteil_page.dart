import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson02_flutter/bloc1/todo_bloc.dart';
import 'package:lesson02_flutter/data/api_service/todo_api_service.dart';

class DeteilPage extends StatefulWidget {
  const DeteilPage({super.key, required this.id, required this.todo, required this.completed, required this.userId});
  final String todo;
  final int id;
  final bool completed;
  final int userId;

  @override
  State<DeteilPage> createState() => _DeteilPageState();
}

class _DeteilPageState extends State<DeteilPage> {
  final TodoBloc _bloc = TodoBloc(TodoApiService());

  @override
  void initState(){
    super.initState();
    _bloc.add(GetDeteilTodoEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<TodoBloc, TodoState>(
          bloc: _bloc,
          builder: (context, state) {
            if(state is LoadedDeteilTodoState){
              return Column(
                children: [
                  Text(widget.todo),
                  Text(widget.id.toString()),
                  Text(widget.userId.toString()),
                  Checkbox(value: widget.completed, onChanged: (value) => ())
                ],
              );
            }
            if(state is ErrorTodoState){
              return Text('ERROR');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}