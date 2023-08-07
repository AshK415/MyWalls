import 'package:freezed_annotation/freezed_annotation.dart';

part 'url_model.freezed.dart';
part 'url_model.g.dart';

@freezed
//@JsonSerializable()
class UrlModel with _$UrlModel {
  factory UrlModel({
    required String raw,
    required String full,
    required String regular,
    required String small,
    required String thumb,
  }) = _UrlModel;
  const UrlModel._();

  factory UrlModel.fromJson(Map<String, dynamic> json) =>
      _$UrlModelFromJson(json);

  // Map<String, dynamic> toJson() => _$UrlModelToJson(this);
}
