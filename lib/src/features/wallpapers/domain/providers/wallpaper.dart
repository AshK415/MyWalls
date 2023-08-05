import 'package:mywalls/src/core/core.dart';
import 'package:mywalls/src/env/env.dart';
import 'package:mywalls/src/features/wallpapers/domain/providers/app_state.dart';
import 'package:mywalls/src/shared/utils/network_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallpaper.g.dart';

@riverpod
class Wallpaper extends _$Wallpaper {
  late Api api;
  @override
  Future<AppState> build() {
    state = AsyncData(AppState.inital());
    api = Api(NetworkClient.instance.dio);
    return _loadInitial();
  }

  Future<AppState> _loadInitial() async {
    state = const AsyncLoading();
    final res = await api.getRandomPhotos(Env.unsplashApiKey, 30);
    return state.value!.copyWith(feeds: res);
  }

  // FutureOr<List<ImageModel>> fetchRandomImages() async {
  //   try {
  //     final res = await api.getRandomPhotos(Env.unsplashApiKey, 30);
  //     if (res.statusCode == 200) {
  //       //print(res.data);
  //       final tres = (res.data) as List<dynamic>;
  //       final images = tres
  //           .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
  //           .toList();
  //       return images;
  //     }
  //     debugPrint('[#] WallpaperProvider: Got error => ${res.statusCode}');
  //     return List.empty();
  //   } catch (e) {
  //     debugPrint('[#] WallpaperProvider: Got error => ${e.toString()}');
  //     return List.empty();
  //   }
  // }
}
