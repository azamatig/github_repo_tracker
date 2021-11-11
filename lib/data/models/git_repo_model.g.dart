// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_repo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitRepoModel _$GitRepoModelFromJson(Map<String, dynamic> json) {
  return GitRepoModel(
    owner: GitUserModel.fromJson(json['owner'] as Map<String, dynamic>),
    fullName: json['full_name'] ?? '',
    openIssues: json['open_issues'] ?? 1,
    pushedAt: DateTime.parse(json['pushed_at']),
    stargazersCount: json['stargazers_count'] ?? 0,
    description: json['description'] ?? '...',
  );
}

// ignore: unused_element
Map<String, dynamic> _$GitRepoModelToJson(GitRepoModel instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'open_issues': instance.openIssues,
      'stargazers_count': instance.stargazersCount,
      'pushed_at': instance.pushedAt,
      'description': instance.description,
      'full_name': instance.fullName,
    };
