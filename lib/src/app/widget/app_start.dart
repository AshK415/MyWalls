import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:mywalls/src/shared/utils/network_client.dart';

@immutable
class AppStart {
  const AppStart._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    NetworkClient.instance.setup();
    FlutterError.onError = (details) {
      log(details.exceptionAsString(), stackTrace: details.stack);
    };
  }
}
