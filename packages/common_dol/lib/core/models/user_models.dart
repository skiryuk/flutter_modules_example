import 'package:json_annotation/json_annotation.dart';

part 'user_models.g.dart';

@JsonSerializable()
class UserModel {
  final String firstName;
  final String? middleName;
  final String lastName;
  final String? phone;
  final String? email;
  final String? jobTitle;
  final List<String> permissions;

  UserModel({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.jobTitle,
    this.permissions = const [],
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
