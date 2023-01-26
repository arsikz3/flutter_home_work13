import 'package:flutter_home_work13_provider/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_home_work13_provider/models/product.dart';
import 'package:flutter_home_work13_provider/notifiers/init_change_notifier.dart';
import 'package:flutter_home_work13_provider/widgets/product_details.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Category category;

  const CategoryDetailScreen({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список товаров'),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: FutureBuilder(
            future:
                context.read<ECommerceAppState>().getCatProducts(category.id),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<Product>> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        late Product? products = snapshot.data?[index];
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => MultiProvider(
                                  providers: [
                                    ChangeNotifierProvider<AppCountState>(
                                      create: (_) => AppCountState(),
                                    ),
                                  ],
                                  child: ProductDetailsScreen(
                                    product: products,
                                  ),
                                ),
                              ));
                            },
                            title: Text(products!.title),
                            subtitle: Text(products.description),
                            trailing: Text(products.price.toString()),
                          ),
                        );
                      });
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            },
          )),
    );
  }
}
