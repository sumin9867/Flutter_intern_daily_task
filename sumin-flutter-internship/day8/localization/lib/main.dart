import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/config/theme.dart';
import 'package:localization/state/cubit.dart';
import 'package:localization/screen/login_page.dart';
import 'package:localization/screen/signup_page.dart';
import 'package:localization/state/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'Signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUp();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, Locale?>(
        builder: (context, state) {
          return BlocBuilder<ThemeCubit, MyTheme?>(
            builder: (context, themestate) {
              return MaterialApp.router(
                routerConfig: _router,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: state,
                theme: _getTheme(themestate),
              );
            },
          );
        },
      ),
    );
  }

  ThemeData _getTheme(MyTheme? themestate) {
    switch (themestate) {
      case MyTheme.light:
        return AppTheme.lightTheme;
      case MyTheme.dark:
        return AppTheme.darkTheme;
      default:
        return AppTheme.lightTheme; // Default to light theme
    }
  }
}
