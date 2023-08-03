import 'package:flutter/widgets.dart';
import 'package:mywalls/src/utils/network_client.dart';

@immutable
class AppStart {
  const AppStart._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    NetworkClient.instance.setup();
  }
}
