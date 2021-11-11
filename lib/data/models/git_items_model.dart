import 'package:github_repo_tracker/data/models/git_repo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'git_items_model.g.dart';

@JsonSerializable()
class GitItemsModel {
  List<GitRepoModel> items;

  GitItemsModel({required this.items});

  factory GitItemsModel.fromJson(Map<String, dynamic> json) =>
      _$GitItemsModelFromJson(json);
}
