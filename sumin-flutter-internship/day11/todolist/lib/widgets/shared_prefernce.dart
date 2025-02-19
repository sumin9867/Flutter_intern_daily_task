import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/model/todo.dart';

class CustomLocalService {
  late SharedPreferences _instance;

  Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  Future<void> addTodo(Todo todo) async {
    List<String> todos = _instance.getStringList('todos') ?? [];
    todos.add(jsonEncode(todo.toJson()));
    await _instance.setStringList('todos', todos);
  }

  List<Todo> getTodos() {
    List<String>? todoStrings = _instance.getStringList('todos');
    if (todoStrings != null) {
      return todoStrings
          .map((json) => Todo.fromJson(jsonDecode(json)))
          .toList();
    }
    return [];
  }

  Future<void> removeTodo(int index) async {
    List<String> todos = _instance.getStringList('todos') ?? [];
    if (index >= 0 && index < todos.length) {
      todos.removeAt(index);
      await _instance.setStringList('todos', todos);
    }
  }

  // Future<bool> isCompleted(int index) async {
  //   List<String> todos = _instance.getStringList('todos') ?? [];
  //   if (index > 0 && index < todos.length) {
  //     final todoModels =
  //         todos.map((json) => Todo.fromJson(jsonDecode(json))).toList();

  //     return todoModels[index].isCompleted;
  //   }
  //   throw UnimplementedError();
  // }

//   Future<void> toggleCompleted(int index) async {
//     List<String> todos = _instance.getStringList('todos') ?? [];
//     if (index >= 0 && index < todos.length) {
//       List<Todo> todoModels =
//           todos.map((json) => Todo.fromJson(jsonDecode(json))).toList();

//       Todo todo = todoModels[index];
//       Todo modifiedToDo = todo.copyWith(
//         isCompleted: !todo.isCompleted,
//       );

//       todoModels[index] = modifiedToDo;

//       List<String> todoStrings =
//           todoModels.map((e) => jsonEncode(e.toJson())).toList();

//       await _instance.setStringList('todos', todoStrings);
//       log("Toggled completed status for todo at index $index");
//     }
//   }
// }
}
