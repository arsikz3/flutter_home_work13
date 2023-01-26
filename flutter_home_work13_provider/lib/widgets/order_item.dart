import 'package:flutter_home_work13_provider/models/order.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  final VoidCallback onTap;

  const OrderItem({
    super.key,
    required this.order,
    required this.onTap,
  });

  @override
  Widget build(context) {
    return ListTile(
      title: Text(order.product.title),
      subtitle: Text(order.product.category.name),
      leading: Text(order.quant.toString()),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onTap,
      ),
    );
  }
}
