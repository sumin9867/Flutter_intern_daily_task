import 'package:flutter/material.dart';

class AddItems extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    String task = "";
    // why not String task;
    return AlertDialog(
      title: const Text("Addd a Items"),
      content: Form(
        key: _formkey,
        child: TextFormField(
          onChanged: (value) {
            task = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Pelae enter something";
            }
            return null;
          },
          decoration: const InputDecoration(hintText: "Enter the new task"),
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                // ..
                Navigator.of(context).pop(task);
                // ?????
              }
            },
            child: const Text("Add"))
      ],
    );
  }
}
