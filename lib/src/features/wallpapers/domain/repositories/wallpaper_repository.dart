import 'package:mywalls/src/features/wallpapers/domain/models/models.dart';

abstract class WallPaperRepository {
  Future<ImageModel> fetchFeeds({int count = 30});
  Future<ImageModel> searchImages({required String query, int count = 30});
  Future<ImageModel> fetchTags({required String tags, int count = 30});
  void bookmarkImage({required String id});
  Future<ImageModel> fetchBookmarkedImages();
}
