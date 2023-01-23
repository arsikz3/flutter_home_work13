import 'package:flutter_home_work13_provider/repository/category_repository.dart';
import 'package:flutter_home_work13_provider/repository/order_repository.dart';
import 'package:provider/provider.dart';
import 'package:flutter_home_work13_provider/notifiers/init_change_notifier.dart';
import 'package:flutter_home_work13_provider/widgets/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const RatingProviderApp());

class RatingProviderApp extends StatelessWidget {
  const RatingProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => RatingAppState(
                    ConstCategoryRepository(),
                    ConstOrderRepository(),
                  )),
        ],
        child: const MaterialApp(
          title: 'E-Commerce',
          home: HomeScreen(),
        ));
  }
}
