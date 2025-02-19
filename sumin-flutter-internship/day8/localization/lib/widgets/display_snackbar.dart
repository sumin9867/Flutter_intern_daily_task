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
