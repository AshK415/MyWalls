import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mywalls/src/features/wallpapers/domain/models/models.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const AppState._();
  factory AppState(
      {required List<ImageModel> feeds,
      required Set<String> bookmarked,
      required List<ImageModel> searchResults}) = _AppState;

  factory AppState.inital() =>
      AppState(feeds: const [], bookmarked: const {}, searchResults: const []);
}
