import 'package:bloc_prac/bloc/todo/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('To Do List'),
          centerTitle: true,
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return state.todoList.isNotEmpty
                ? ListView.builder(
                    itemCount: state.todoList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Item $index ${state.todoList[index]}'),
                        trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context.read<TodoBloc>().add(RemoveTodo(index));
                            }),
                      );
                    },
                  )
                : const Center(
                    child: Text('No items in the list'),
                  );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<TodoBloc>().add(AddTodo('Item ${DateTime.now()}'));
          },
          child: const Icon(Icons.add),
        ));
  }
}
