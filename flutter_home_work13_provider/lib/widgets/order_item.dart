import 'package:flutter_home_work13_provider/models/order.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(context) {
    return ListTile(
      title: Text(order.product.title),
      subtitle: Text(order.product.category.name),
      trailing: Text(order.quant.toString()),
      // leading: Badg
    );
    // return GestureDetector(
    //   onTap: onTap,
    //   child: Hero(
    //     tag: '_tag${order.product.id}_',
    //     child: Align(
    //       alignment: Alignment.bottomRight,
    //       child: Container(
    //         margin: const EdgeInsets.all(4),
    //         padding: const EdgeInsets.all(5),
    //         decoration: BoxDecoration(
    //             color: Theme.of(context).primaryColor,
    //             borderRadius: BorderRadius.circular(10)),
    //         child: Text(
    //           order.product.title,
    //           style: Theme.of(context).textTheme.bodyText1,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
