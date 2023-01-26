import 'package:flutter_home_work13_provider/models/category.dart';
import 'package:flutter_home_work13_provider/notifiers/init_change_notifier.dart';
import 'package:flutter_home_work13_provider/repository/product_repository.dart';
import 'package:flutter_home_work13_provider/widgets/categories_item.dart';
import 'package:flutter_home_work13_provider/widgets/category_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categories;
  final Function onTapped;

  const CategoriesList({
    required this.categories,
    required this.onTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5),
      itemBuilder: (BuildContext context, int index) {
        final cat = categories[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChangeNotifierProvider(
            create: (context) => ProductAppState(ConstProductRepository()),
            child: CategoryItem(
              category: cat,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => CategoryDetailScreen(
                    category: cat,
                  ),
                ));
              },
            ),
          ),
        );
      },
    );
  }
}
