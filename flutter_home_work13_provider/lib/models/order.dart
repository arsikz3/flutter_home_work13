// Model of Product
import 'package:flutter_home_work13_provider/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

@freezed
class Order with _$Order {
  const factory Order({required int quant, required Product product}) = _Order;

  @override
  String toString() {
    return 'Order{id: $product, name: $quant}';
  }
}
