import 'package:freezed_annotation/freezed_annotation.dart';

part 'kitten.freezed.dart';
part 'kitten.g.dart';

@freezed
class Kitten with _$Kitten {
  const factory Kitten({
    required int id,
    required String name,
  }) = _Kitten;

  factory Kitten.fromJson(Map<String, Object?> json)
  => _$KittenFromJson(json);
}
