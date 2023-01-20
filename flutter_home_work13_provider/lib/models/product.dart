// Model of Product
import 'package:flutter_home_work13_provider/models/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product(
      {required int id,
      required String title,
      required double price,
      required String description,
      required List<String> images,
      required String creationAt,
      required String updatedAt,
      required Category category}) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
