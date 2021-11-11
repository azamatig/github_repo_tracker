import 'package:json_annotation/json_annotation.dart';

part 'git_user_model.g.dart';

@JsonSerializable()
class GitUserModel {
  String login;
  String avatarUrl;

  GitUserModel({
    required this.login,
    required this.avatarUrl,
  });

  factory GitUserModel.fromJson(Map<String, dynamic> json) =>
      _$GitUserModelFromJson(json);
}
