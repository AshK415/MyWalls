import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mywalls/src/app/app_start.dart';

import 'src/app/app.dart';

void main() async {
  await AppStart.init();
  runApp(const ProviderScope(overrides: [], child: App()));
}
