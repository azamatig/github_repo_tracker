// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitItemsModel _$GitItemsModelFromJson(Map<String, dynamic> json) {
  return GitItemsModel(
    items: (json['items'] as List<dynamic>)
        .map((e) => GitRepoModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

// ignore: unused_element
Map<String, dynamic> _$GitItemsModelToJson(GitItemsModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
