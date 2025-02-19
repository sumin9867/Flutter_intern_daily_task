import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/Screen/homepage.dart';
import 'package:todolist/cubit/checkboxcubit.dart';

import 'package:todolist/cubit/todolistcubit.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/widgets/shared_prefernce.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localService = CustomLocalService();
  await localService.init();

  final List<Todo> todo = localService.getTodos();

  runApp(MyApp(
    localservices: localService,
    initialTodos: todo,
  ));
}

GoRouter _goRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const Homepage();
    },
  )
]);

class MyApp extends StatelessWidget {
  final CustomLocalService localservices;
  final List<Todo> initialTodos;
  const MyApp(
      {super.key, required this.localservices, required this.initialTodos});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                TodoListCubit(localService: localservices)..loadList(),
          ),
          BlocProvider(create: (context) => CheckboxCubit())
        ],
        child: MaterialApp.router(
          routerConfig: _goRouter,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
        ));
  }
}
