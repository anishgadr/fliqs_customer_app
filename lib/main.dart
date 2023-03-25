import 'package:fliqs_app/fliqs_app.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(FliqsApp());
}
