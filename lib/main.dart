import 'package:bloc_prac/bloc/counter/counter_bloc.dart';
import 'package:bloc_prac/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_prac/bloc/switch/switch_bloc.dart';
import 'package:bloc_prac/bloc/todo/todo_bloc.dart';
import 'package:bloc_prac/ui/todo_screen.dart';
import 'package:bloc_prac/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils()))
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ToDoScreen()),
    );
  }
}
