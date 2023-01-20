import 'package:flutter_home_work13_provider/models/category.dart';
import 'package:flutter_home_work13_provider/models/speaker.dart';
import 'package:flutter_home_work13_provider/notifiers/init_change_notifier.dart';
import 'package:flutter_home_work13_provider/repository/category_repository.dart';
import 'package:flutter_home_work13_provider/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_home_work13_provider/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final Category category;

  const CategoryItem({
    super.key,
    required this.onTap,
    required this.category,
  });

  @override
  Widget build(context) {
    // return Consumer<RatingAppState>(builder: (context, state, child) {
    // return Consumer<ProductAppState>(builder: (context, state, child) {
    // state.getCategoryProducts(category.id);
    // print(state.talks);
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: '_tag${category.id}_',
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(category.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                category.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ),
      ),
    );
    // }); //Consumer
  }

  /*
    ListTile(
      onTap: onTap,
      // leading: CircleAvatar(
      //   backgroundImage: NetworkImage(category.image),
      // ),
      // leading: Image.network(category.image),
      // trailing: _getIconWidget(speaker.rating ?? 0),
      title: Hero(
          tag: '_tag${category.id}_',
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(category.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(100)),
                child: Text(
                  category.name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          )),
          */
  /*
        Column(
          children: [
            Text(
              category.name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Container(
              child: Text(
                category.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(category.image),
                  fit: BoxFit.fill,
                ),
              ),
            )

            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   child: Image.network(
            //     category.image,
            //     fit: BoxFit.fitHeight,
            //   ),
            // ),
          ],
        ),
        */

  // subtitle: Text(
  //   category.name,
  //   maxLines: 2,
  //   overflow: TextOverflow.ellipsis,
  //   style: Theme.of(context).textTheme.bodyText2,
  // ),
  // );
  // }

  Widget _getIconWidget(int rating) {
    final icon = Utils.getRatingIcon(rating);
    return icon != null
        ? IconButton(
            icon: icon,
            onPressed: () {},
          )
        : SizedBox.shrink();
  }
}
