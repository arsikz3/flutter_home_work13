import 'package:flutter_home_work13_provider/models/product.dart';
import 'package:flutter_home_work13_provider/models/speaker.dart';
import 'package:flutter_home_work13_provider/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  // final Function(int) ratingChanged;

  const ProductDetailsScreen({
    required this.product,
    // required this.ratingChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация по товару'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        child: Image.network(product.images[index],
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width),
                      ),
                    );
                  }),
            ),

            Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                ),
                child: Center(
                    child: Text(product.title,
                        style: const TextStyle(
                          fontSize: 30.0,
                        )))),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                    child: Text(product.description,
                        style: const TextStyle(
                          fontSize: 20.0,
                        )))),
            // RatingBar.builder(
            //     initialRating: speaker.rating?.toDouble() ?? 0,
            //     direction: Axis.horizontal,
            //     allowHalfRating: true,
            //     itemCount: 5,
            //     itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            //     itemBuilder: (context, index) =>
            //         Utils.getRatingIcon(index + 1) ?? const SizedBox.shrink(),
            //     onRatingUpdate: (rating) => ratingChanged(rating.toInt())),
          ],
        ),
      ),
    );
  }
}
