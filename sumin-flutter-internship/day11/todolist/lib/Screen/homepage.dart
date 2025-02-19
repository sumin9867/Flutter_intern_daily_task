import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/widgets/additems.dart';
import 'package:todolist/widgets/toDoListItem.dart';
import 'package:todolist/cubit/todolistcubit.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("To DO list")),
        body: const ItemsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddItems();
                }).then((task) {
              if (task != null) {
                context.read<TodoListCubit>().additems(task);
              }
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}
