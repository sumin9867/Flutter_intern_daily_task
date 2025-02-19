import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/cubit/checkboxcubit.dart';
import 'package:todolist/cubit/todolistcubit.dart';
import 'package:todolist/model/todo.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({super.key});

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoListCubit, List<Todo>>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                final todoItem = state[index];
                return ListTile(
                  leading: BlocBuilder<CheckboxCubit, CheckboxState>(
                    builder: (context, state) {
                      return Checkbox(
                        value: state == CheckboxState.checked,
                        onChanged: (newValue) {
                          setState(() {
                            context.read<CheckboxCubit>().toggleCheckbox();
                          });
                        },
                      );
                    },
                  ),
                  title: Text(todoItem.todoName),
                  trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<TodoListCubit>().removeitems(index);
                      }),
                );
              });
        },
      ),
    );
  }
}
