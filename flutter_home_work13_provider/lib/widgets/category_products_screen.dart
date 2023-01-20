import 'package:flutter_home_work13_provider/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_home_work13_provider/models/product.dart';
import 'package:flutter_home_work13_provider/notifiers/init_change_notifier.dart';
import 'package:flutter_home_work13_provider/repository/product_repository.dart';
import 'package:flutter_home_work13_provider/widgets/product_details.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Category category;
  // final Function(int) ratingChanged;

  const CategoryDetailScreen({
    required this.category,
    // required this.ratingChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Consumer<RatingAppState>(builder: (context, state, child) {
    // state.getCategoryProducts(category.id);
    // <List<Product>> products =
    //     context.read<RatingAppState>().getCatProducts(category.id);
    // print(products);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Список товаров'),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: FutureBuilder(
            future: context.read<RatingAppState>().getCatProducts(category.id),
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
                        // return Text(products!.title);
                        // return ProductDetailsScreen(product: products!);
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      ChangeNotifierProvider<AppCountState>(
                                          create: (_) => AppCountState(),
                                          child: Consumer<AppCountState>(
                                            builder: (context, state, child) =>
                                                ProductDetailsScreen(
                                              product: products,

                                              // ratingChanged: (r) => ratingChanged(speaker, r),
                                            ),
                                          ))));
                            },
                            title: Text(products!.title),
                            subtitle: Text(products!.description),
                            // leading: Image.asset(products.images[1],
                            //     fit: BoxFit.fitWidth,
                            //     width: MediaQuery.of(context).size.width),
                            trailing: Text(products!.price.toString()),
                          ),
                        );
                      });
                  // return Text(snapshot.data.toString(),
                  //     style: const TextStyle(
                  //         color: Colors.cyan, fontSize: 36));

                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            },
            // return ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: state.products.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       final products = state.products[index];

            //       return Text(products.title);
            //     });
          )),
    );
    // });
  }
}
