import 'package:github_repo_tracker/data/models/git_user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'git_repo_model.g.dart';

@JsonSerializable()
class GitRepoModel {
  GitUserModel owner;
  int openIssues;
  int stargazersCount;
  DateTime pushedAt;
  String description;
  String fullName;

  GitRepoModel({
    required this.owner,
    required this.fullName,
    required this.openIssues,
    required this.pushedAt,
    required this.stargazersCount,
    required this.description,
  });

  factory GitRepoModel.fromJson(Map<String, dynamic> json) =>
      _$GitRepoModelFromJson(json);
}
