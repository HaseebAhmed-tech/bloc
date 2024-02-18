import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class EquitableTesting extends StatefulWidget {
  const EquitableTesting({super.key});

  @override
  State<EquitableTesting> createState() => _EquitableTestingState();
}

class _EquitableTestingState extends State<EquitableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Person person1 = Person(name: 'Haseeb', age: 21);
        Person person2 = Person(name: 'Haseeb', age: 21);
        print(person1 == person2);
      }),
    );
  }
}

class Person extends Equatable {
  final String? name;
  final int? age;
  Person({required this.name, required this.age});

  @override
  // TODO: implement props
  List<Object?> get props => [name, age];
}
