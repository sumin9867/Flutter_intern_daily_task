import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final Widget child;

  const WiredashApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: " movieapp-fza3gr6",
      secret: "ARKoPMfbuFUivjZSkmxVKIckBlXfKTzu",
      theme: WiredashThemeData(brightness: Brightness.dark),
      child: child,
    );
  }
}
