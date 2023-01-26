import 'package:flutter_home_work13_provider/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_home_work13_provider/notifiers/init_change_notifier.dart';
import 'package:flutter_home_work13_provider/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrderList extends StatelessWidget {
  final List<Order> orders;

  const OrderList({
    required this.orders,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (BuildContext context, int index) {
        final order = orders[index];
        return OrderItem(
            order: order,
            onTap: () {
              context.read<ECommerceAppState>().removeOrder(index);
            });
      },
    );
  }
}
