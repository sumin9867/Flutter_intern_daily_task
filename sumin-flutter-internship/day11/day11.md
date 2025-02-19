# Daily Report - Day 11

## Date: March 12, 2024

### Summary:

Today, I delved deeper into state management using Cubit. I successfully implemented the functionality for a TodoList app, which includes features such as adding tasks, deleting tasks, and marking tasks as complete.

### Tasks Completed:

- Learned about state management using Cubit.
- Implemented TodoList functionality:
  - Add Task: Users can add new tasks with details such as title.
  ```
    void additems(String task) {
    if (task.isNotEmpty) {
      final todo = Todo(
        todoName: task,
        isCompleted: false,
      );
      state.add(todo);
      emit(List.from(state));
    }
  }
```
  - Delete Task: Users can remove tasks from the list.
```
 void removeitems(int index) {
    state.removeAt(index);
    emit(List.from(state));
  }
```
  - Mark as Complete: Users can mark tasks as completed.
```
 void toggleCompleted(int index) {
    final item = state[index];
    final newItem = Todo(
      todoName: item.todoName,
      isCompleted: !item.isCompleted,
    );
    state[index] = newItem;
    emit(List.from(state));
  }
```

### Tasks Planned for Tomorrow:

- Refine and optimize the code for the TodoList app.
- Write more detailed explanations for each functionality.
- Explore advanced state management techniques with Cubit.

### Challenges Faced:

I encountered some challenges while understanding the concept of state management and implementing it with Cubit. However, through research and experimentation, I was able to overcome these challenges and achieve the desire