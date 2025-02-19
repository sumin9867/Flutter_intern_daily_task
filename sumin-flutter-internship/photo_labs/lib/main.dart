import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import "dependency_injection.dart/get_it.dart" as getit;
import 'package:photo_labs/presentation_layer/screen/photo_lab_app.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getit.setupDependencies());
  runApp(const PhotoLabApp());
}
