import 'package:dio/dio.dart';
import 'package:flutter_home_work13_provider/models/category.dart';
import 'package:flutter_home_work13_provider/models/product.dart';
import 'package:flutter_home_work13_provider/utils/endpoints.dart';

abstract class CategoriesRepository {
  // const CategoriesRepository();

  Future<List<Category>> loadCategories();
  Future<List<Product>> loadCategyProducts(int id);
}

class ConstCategoryRepository extends CategoriesRepository {
  ConstCategoryRepository();

  List<Category> allcategory = <Category>[];

  @override
  Future<List<Category>> loadCategories() async {
    List<Category> categories = [];

    try {
      final Response res = await Dio().get(Endpoints.getCategories);

      // List<Category> cats = await res.data.map((cat) {
      //   return Category.fromJson(cat);
      // }).toList();

      for (var element in res.data) {
        categories.add(Category.fromJson(element));
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
    return categories;
  }

  @override
  Future<List<Product>> loadCategyProducts(int id) async {
    List<Product> products = [];

    try {
      final Response res = await Dio()
          .get(Endpoints.getProducts, queryParameters: {"categoryId": id});
      for (var element in res.data) {
        products.add(Product.fromJson(element));
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
    return products;
  }
}
