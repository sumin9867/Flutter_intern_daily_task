import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_book/cubit/note_cubit.dart';
import 'package:note_book/cubit/textfield_focus.dart';
import 'package:note_book/screen/add_note.dart';
import 'package:note_book/screen/homepage.dart';
import 'package:note_book/screen/recent_note.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'recent',
          builder: (BuildContext context, GoRouterState state) {
            return const RecentPage();
          },
        ),
        GoRoute(
          path: 'addnote',
          builder: (BuildContext context, GoRouterState state) {
            return const AddNote();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteCubit()..loadDataFromSharedPreferences(),
        ),
        BlocProvider(
          create: (context) => FoucusCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
