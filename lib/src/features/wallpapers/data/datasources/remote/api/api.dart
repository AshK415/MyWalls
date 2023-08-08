import 'package:dio/dio.dart' hide Headers;
import 'package:mywalls/src/features/wallpapers/domain/domain.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api(Dio dio) = _Api;

  @GET('/photos/random')
  Future<HttpResponse<List<ImageModel>>> getRandomPhotos(
    @Query('client_id') String clientId,
    @Query('count') int count,
  );

  @GET('/topics/{topic}/photos')
  Future<Response> getTopic(
    @Path() String topic,
    @Query('client_id') String clientId,
    @Query('per_page') int perPage,
    @Query('page') int page,
  );

  @GET('/photos/random')
  Future<List<ImageModel>> searchImage(
    @Query('client_id') String clientId,
    @Query('count') int count,
    @Query('query') String query,
  );
}
