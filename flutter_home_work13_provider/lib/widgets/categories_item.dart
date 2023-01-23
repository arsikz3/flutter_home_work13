import 'package:flutter_home_work13_provider/models/category.dart';
import 'package:flutter/material.dart';

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
  }
}
