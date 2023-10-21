// ignore_for_file: overridden_fields

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/domain/entity/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  @JsonKey(name: "id", defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: "first_name", defaultValue: '')
  final String firstName;
  @override
  @JsonKey(name: "last_name", defaultValue: '')
  final String lastName;
  @JsonKey(name: "avatar", defaultValue: '')
  final String avatar;
  @JsonKey(name: "email", defaultValue: '')
  final String email;

  UserModel(
      {required this.avatar,
      required this.email,
      required this.firstName,
      required this.id,
      required this.lastName})
      : super(firstName: firstName, image: avatar, lastName: lastName);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
