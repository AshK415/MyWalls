import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mywalls/src/app/app.dart';

Future<void> start() async {
  //await AppStart.init();
  runApp(
    UncontrolledProviderScope(
      container: await AppStart.init(),
      child: const App(),
    ),
  );
}
