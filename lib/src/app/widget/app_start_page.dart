import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mywalls/src/app/provider/app_start_provider.dart';
import 'package:mywalls/src/features/wallpapers/wallpapers.dart';
import 'package:mywalls/src/shared/shared.dart';

class AppStartPage extends ConsumerWidget {
  const AppStartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartNotifierProvider);
    return state.when(
      data: (data) {
        return data.maybeWhen(
          initial: () => const LoadingWidget(),
          authenticated: () => const HomePage(),
          orElse: () => const LoadingWidget(),
        );
      },
      error: (e, st) => const EErrorWidget(),
      loading: () => const LoadingWidget(),
    );
  }
}
