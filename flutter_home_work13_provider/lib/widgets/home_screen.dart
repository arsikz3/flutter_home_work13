import 'package:flutter_home_work13_provider/widgets/categories_list.dart';
import 'package:flutter_home_work13_provider/widgets/orders_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_home_work13_provider/models/app_tab.dart';
import 'package:flutter_home_work13_provider/notifiers/init_change_notifier.dart';
import 'package:flutter_home_work13_provider/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ECommerceAppState>(builder: (context, state, child) {
      if (!state.isLoaded) {
        return const LoadingIndicator();
      } else {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.category),
              onPressed: () {
                // print(state.products[1].category.toString());
              },
            ),
            title: const Text('E-Commerce'),
          ),
          body: state.activeTabIndex == AppTab.categories.index
              ? CategoriesList(
                  categories: state.categories,
                  onTalkTapped: () {},
                )
              : OrderList(
                  orders: state.orders,
                  // onTalkTapped: () {},
                ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.activeTabIndex,
            onTap: state.updateTab,
            items: AppTab.values.map((tab) {
              return BottomNavigationBarItem(
                icon: Icon(
                  tab == AppTab.categories ? Icons.category : Icons.badge,
                ),
                label: tab == AppTab.categories ? 'Категории' : 'Корзина',
              );
            }).toList(),
          ),
        );
      }
    });
  }
}
