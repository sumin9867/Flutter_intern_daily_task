### Daily Report: Day 9

#### Stateful Widget Lifecycle:

Stateful widgets in Flutter have a lifecycle that determines how they behave during various stages of their existence. Some key lifecycle methods include:

- **initState():** This method is called when the stateful widget is inserted into the tree. It is typically used for one-time initialization tasks, such as setting up controllers or listeners.

- **didChangeDependencies():** This method is called when the dependencies of the widget change. It can be used to perform tasks that depend on the widget's context or inherited widgets.

- **build():** This method is called whenever the widget needs to rebuild its UI. It should return the widget's UI representation.

- **didUpdateWidget():** This method is called when the widget is rebuilt with a new instance of itself. It can be used to compare old and new widget properties and perform necessary updates.

- **dispose():** This method is called when the widget is removed from the tree. It is typically used to release resources, such as closing streams or disposing of controllers.

#### Cubit and Bloc:

- **Cubit:** Cubit is a simple implementation of the BLoC pattern that manages state and business logic. It typically exposes methods for interacting with the state and emits state changes using streams.

- **Bloc:** Bloc (Business Logic Component) is a more feature-rich implementation of the BLoC pattern. It adds additional functionality like events and transformations, making it more suitable for complex applications.

Both Cubit and Bloc provide a way to separate business logic from UI components, promoting better code organization and testability.

#### Assignment Completion:

- With the guidance of my mentor, I successfully completed the assignment on understanding the lifecycle of stateful widgets and gained a better understanding of how to properly structure and manage code using Cubit and Bloc patterns.

- I learned how to implement stateful widgets with proper lifecycle management and how to use Cubit and Bloc to separate concerns and manage application state effectively.

- My mentor provided detailed explanations and examples, which helped me grasp the concepts more thoroughly and apply them in practical scenarios.

Overall, Day 9 was productive in deepening my understanding of Flutter's state management and architecture patterns. I look forward to further exploring these concepts in future projects.
