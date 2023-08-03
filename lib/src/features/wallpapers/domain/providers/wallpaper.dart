import 'package:flutter/foundation.dart';
import 'package:mywalls/src/core/core.dart';
import 'package:mywalls/src/env/env.dart';
import 'package:mywalls/src/features/wallpapers/domain/models/models.dart';
import 'package:mywalls/src/utils/network_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallpaper.g.dart';

@riverpod
class Wallpaper extends _$Wallpaper {
  late Api api;
  @override
  FutureOr<List<ImageModel>> build() async {
    state = const AsyncLoading();
    api = Api(NetworkClient.instance.dio);
    return fetchRandomImages();
  }

  FutureOr<List<ImageModel>> fetchRandomImages() async {
    try {
      final res = await api.getRandomPhotos(Env.unsplashApiKey, 30);
      if (res.statusCode == 200) {
        final tres = (res.data) as List<Map<String, dynamic>>;
        final images = tres.map((e) => ImageModel.fromJson(e)).toList();
        return images;
      }
      debugPrint('[#] WallpaperProvider: Got error => ${res.statusCode}');
      return List.empty();
    } catch (e) {
      debugPrint('[#] WallpaperProvider: Got error => ${e.toString()}');
      return List.empty();
    }
  }
}
