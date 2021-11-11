// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitUserModel _$GitUserModelFromJson(Map<String, dynamic> json) {
  return GitUserModel(
    login: json['login'] ?? 'Error loading data',
    avatarUrl: json['avatar_url'] ??
        'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
  );
}

// ignore: unused_element
Map<String, dynamic> _$GitUserModelToJson(GitUserModel instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
    };
