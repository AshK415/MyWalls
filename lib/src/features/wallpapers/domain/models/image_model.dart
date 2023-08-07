import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mywalls/src/features/wallpapers/domain/models/url_model.dart';
part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
//@JsonSerializable()
class ImageModel with _$ImageModel {
  factory ImageModel({required String id, required UrlModel urls}) =
      _ImageModel;
  const ImageModel._();

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  // Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
