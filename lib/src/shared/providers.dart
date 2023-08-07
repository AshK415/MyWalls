import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Top level providers initialization
final sharedPreferencesProvider =
    FutureProvider((ref) => SharedPreferences.getInstance());

Future<void> initProviders(ProviderContainer container) async {
  await container.read(sharedPreferencesProvider.future);

  /// Auth
  //container.read(authControllerProvider);
}
