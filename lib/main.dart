import 'dart:async';

import 'package:mywalls/start.dart';

void main() async {
  await runZonedGuarded(start, (error, stack) {
    // Log to firebase
  });
  //await start();
}
