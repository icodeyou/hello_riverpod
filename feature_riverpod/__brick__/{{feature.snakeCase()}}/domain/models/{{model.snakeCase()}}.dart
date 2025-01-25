import 'package:freezed_annotation/freezed_annotation.dart';

part '{{model.snakeCase()}}.freezed.dart';
part '{{model.snakeCase()}}.g.dart';

@freezed
class {{model.pascalCase()}} with _${{model.pascalCase()}} {
  const factory {{model.pascalCase()}}({
    required int id,
    required String breed,
  }) = _{{model.pascalCase()}};

  factory {{model.pascalCase()}}.fromJson(Map<String, Object?> json) => _${{model.pascalCase()}}FromJson(json);
}
