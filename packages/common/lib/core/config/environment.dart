import 'package:json_annotation/json_annotation.dart';

part 'environment.g.dart';

/// Класс идентификатора среды (ключ, наименование)
@JsonSerializable()
class Environment {
  final String key;
  final String title;

  const Environment(this.key, this.title);

  factory Environment.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);

  Map<String, dynamic> toJson() => _$EnvironmentToJson(this);
}
