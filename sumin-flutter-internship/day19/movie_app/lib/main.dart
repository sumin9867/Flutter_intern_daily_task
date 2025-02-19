import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dependecy_inject/get_it.dart' as getit;

import 'package:hive/hive.dart';
import 'package:movie_app/common/tables/movie_tables.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:movie_app/presentation/movie_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getit.setupDependencies());
  final appDocumentdir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentdir.path);
  Hive.registerAdapter(MovieTableAdapter());
  runApp(const MovieApp());
}
