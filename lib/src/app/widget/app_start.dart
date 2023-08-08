import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mywalls/src/shared/shared.dart';

@immutable
class AppStart {
  const AppStart._();
  static Future<ProviderContainer> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    NetworkClient.instance.setup();
    FlutterError.onError = (details) {
      log(details.exceptionAsString(), stackTrace: details.stack);
    };
    final container = ProviderContainer(
      overrides: [],
      observers: [
        Logger(),
      ],
    );
    // initialize providers
    //await Future.wait([]);
    await initProviders(container);
    return container;
  }
}
