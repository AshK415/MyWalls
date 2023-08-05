import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mywalls/src/app/app.dart';
import 'package:mywalls/src/shared/shared.dart';

Future<void> start() async {
  await AppStart.init();
  runApp(
    ProviderScope(
      observers: [
        Logger(),
      ],
      child: const App(),
    ),
  );
}
