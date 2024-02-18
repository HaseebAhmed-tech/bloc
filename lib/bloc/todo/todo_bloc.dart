import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodo>(addTodo);
    on<RemoveTodo>(removeTodo);
  }

  void addTodo(TodoEvent event, Emitter<TodoState> emit) {
    emit(state.copyWith(
      todoList: List.of(state.todoList)..add((event as AddTodo).todo),
    ));
  }

  void removeTodo(TodoEvent event, Emitter<TodoState> emit) {
    emit(state.copyWith(
        todoList: List.of(state.todoList)
          ..removeAt((event as RemoveTodo).index)));
  }
}
