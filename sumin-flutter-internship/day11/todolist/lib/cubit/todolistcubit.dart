import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/widgets/shared_prefernce.dart';

class TodoListCubit extends Cubit<List<Todo>> {
  TodoListCubit({required CustomLocalService localService})
      : _localService = localService,
        super([]);
  final CustomLocalService _localService;

  void additems(String task) {
    if (task.isNotEmpty) {
      final todo = Todo(
        todoName: task,
        isCompleted: false,
      );
      _localService.addTodo(todo);
      state.add(todo);
      emit(List.from(state));
      // list.form???
    }
  }

  void removeitems(int index) {
    _localService.removeTodo(index);
    state.removeAt(index);
    emit(List.from(state));
  }

  // void toggleCompleted(int index) {
  //   _localService.toogleCompleted(index);
  //   loadList();

  //   final item = state[index];
  //   final newItem = Todo(
  //     todoName: item.todoName,
  //     isCompleted: !item.isCompleted,
  //   );
  //   state[index] = newItem;
  //   emit(List.from(state));
  // }

  void loadList() {
    final todos = _localService.getTodos();
    emit(todos);
  }
}
