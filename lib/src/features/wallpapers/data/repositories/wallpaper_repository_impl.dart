import 'package:fpdart/fpdart.dart';
import 'package:mywalls/src/env/env.dart';
import 'package:mywalls/src/features/common/domain/failures/failure.dart';
import 'package:mywalls/src/features/wallpapers/data/data.dart';
import 'package:mywalls/src/features/wallpapers/domain/domain.dart';

class WallpaperRepositoryImpl implements WallPaperRepository {
  const WallpaperRepositoryImpl({required this.api});
  final Api api;
  @override
  void bookmarkImage({required String id}) {
    // TODO: implement bookmarkImage
  }

  @override
  Future<Either<Failure, List<ImageModel>>> fetchBookmarkedImages() {
    // TODO: implement fetchBookmarkedImages
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ImageModel>>> fetchFeeds({int count = 30}) async {
    final res = await api.getRandomPhotos(Env.unsplashApiKey, count);
    return right(res);
  }

  @override
  Future<Either<Failure, List<ImageModel>>> fetchTags({
    required String tags,
    int count = 30,
  }) {
    // TODO: implement fetchTags
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ImageModel>>> searchImages({
    required String query,
    int count = 30,
  }) {
    // TODO: implement searchImages
    throw UnimplementedError();
  }
}
