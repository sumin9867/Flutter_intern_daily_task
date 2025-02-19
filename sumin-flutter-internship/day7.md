# Day 7 Daily Report

---

## Summary

Today, I delved deeper into Flutter development, exploring essential concepts to enhance user experience and streamline navigation within the app. I gained insights into alternative approaches for managing keyboard focus, optimized the display of Snackbars, and implemented a more organized navigation system using named routes.

---

## Key Learnings

### Alternative of Focus Node

In Flutter, managing keyboard focus is crucial for enhancing user interaction in text input fields. While the `FocusNode` class is commonly used for this purpose, I discovered an alternative approach using the `autofocus` property of the `TextField` widget. By setting `autofocus` to `true`, the text field automatically receives focus when rendered, simplifying focus management.
```
 textInputAction: TextInputAction.go,
                  onEditingComplete: () {
                    _submitform();
                  },
```

### Keyboard Management with Focus Node

To improve user experience, I learned how to use the `FocusNode.unfocus()` method to programmatically hide the keyboard when a specific action is triggered, such as tapping outside of a text field. This ensures a smoother transition for users and eliminates unnecessary keyboard clutter.

```
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
```

### Handling Multiple Submit Buttons

One challenge I encountered was managing multiple submit buttons in a form, which could lead to excessive Snackbar pop-ups if clicked rapidly. To address this, I implemented a solution to prevent multiple pop-ups by maintaining a single instance of the Snackbar and displaying it only when necessary. This optimization enhances the app's usability and prevents cluttering the interface with redundant messages.

```
import 'dart:async';
import 'package:flutter/material.dart';

class SnackbarManager {
  final BuildContext context;
  late Timer snackTimer;

  SnackbarManager(this.context);
  void displaySnackBar(String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 2),
    ));
    snackTimer = Timer(const Duration(seconds: 2), () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
  }
}
```

### Using Named Routes for Navigation

In the realm of navigation, I explored the power of named routes to streamline the app's navigation flow. By defining named routes in the `MaterialApp`, I created a more organized and scalable navigation structure, making it easier to manage and navigate between different screens in the app. Named routes offer a clear and concise way to define navigation paths, improving code readability and maintainability.

```
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
```

---

## Tasks Completed

1. Explored alternative approaches for managing TextField swiping from the keyboard using TextInputAction .
2. Implemented keyboard management with `FocusNode.unfocus()` for improved user experience.
3. Optimized Snackbar display by preventing multiple pop-ups.
4. Enhanced navigation flow using named routes for a more organized structure.
5. Clean Code.

---

## Goals for Tomorrow

- Likely, diving into new task which will polish my skill more bright.

---

## Reflection

Today's exploration of keyboard management, Snackbar optimization, and named routes has enriched my understanding of Flutter development principles. These concepts are fundamental for building intuitive and user-friendly apps, and I look forward to further refining my skills in these areas.

