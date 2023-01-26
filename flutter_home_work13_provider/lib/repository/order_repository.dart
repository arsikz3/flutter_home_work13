import 'package:flutter_home_work13_provider/models/order.dart';
import 'package:flutter_home_work13_provider/models/product.dart';

abstract class OrderRepository {
  const OrderRepository();

  Future<List<Order>> loadOrder();
  Future<void> saveToOrder(Product product, int quant);
  Future<void> removeOrder(int index);
}

class ConstOrderRepository extends OrderRepository {
  ConstOrderRepository();

  final List<Order> _allOrders = [];

  @override
  Future<List<Order>> loadOrder() async {
    return _allOrders;
  }

  @override
  Future<void> saveToOrder(Product product, int quant) async {
    Order order = Order(quant: quant, product: product);
    _allOrders.add(order);

    return;
  }

  @override
  Future<void> removeOrder(int index) async {
    _allOrders.removeAt(index);
    return;
  }
}
