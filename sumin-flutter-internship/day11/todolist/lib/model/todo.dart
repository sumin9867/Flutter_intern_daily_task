import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String todoName;
  final bool isCompleted;

  const Todo({
    required this.todoName,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() {
    return {'title': todoName, 'iscompleted': isCompleted};
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(todoName: json['title'], isCompleted: json['iscompleted']);
  }

  // Future<Todo> copyWith(
  //   String? todoName,
  //   bool? isCompleted, { bool isCompleted},
  // ) async {
  //   return Todo(
  //     todoName: todoName ?? this.todoName,
  //     isCompleted: isCompleted ?? this.isCompleted,
  //   );
  // }

  @override
  List<Object?> get props => [
        todoName,
        isCompleted,
      ];
}
// ..