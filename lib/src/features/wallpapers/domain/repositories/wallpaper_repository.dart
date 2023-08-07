import 'package:fpdart/fpdart.dart';
import 'package:mywalls/src/features/common/common.dart';
import 'package:mywalls/src/features/wallpapers/domain/models/models.dart';

abstract class WallPaperRepository {
  Future<Either<Failure, List<ImageModel>>> fetchFeeds({int count = 30});
  Future<Either<Failure, List<ImageModel>>> searchImages({
    required String query,
    int count = 30,
  });
  Future<Either<Failure, List<ImageModel>>> fetchTags({
    required String tags,
    int count = 30,
  });
  void bookmarkImage({required String id});
  Future<Either<Failure, List<ImageModel>>> fetchBookmarkedImages();
}
