import 'package:flutter/material.dart';
import 'package:flutter_fliqs/fliqu_main.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(FliqsApp());
}
