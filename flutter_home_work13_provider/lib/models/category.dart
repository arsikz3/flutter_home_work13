// import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'name') required String name,
      @JsonKey(name: 'image') required String image,
      required String creationAt,
      required String updatedAt}) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}




/*
class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,

  });

  int id;
  String name;
  String image;
  DateTime creationAt;
  DateTime updatedAt;
}
*/