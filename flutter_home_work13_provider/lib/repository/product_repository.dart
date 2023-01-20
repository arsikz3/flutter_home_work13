import 'package:dio/dio.dart';
import 'package:flutter_home_work13_provider/models/product.dart';
import 'package:flutter_home_work13_provider/utils/endpoints.dart';

abstract class ProductRepository {
  const ProductRepository();

  Future<List<Product>> loadProducts();
  Future<List<Product>> loadCategoryProducts(int id);
}

class ConstProductRepository extends ProductRepository {
  ConstProductRepository();

  List<Product> allproducts = <Product>[];

  @override
  Future<List<Product>> loadProducts() async {
    List<Product> products = [];
    print('loadProducts');
    try {
      final Response res = await Dio().get(Endpoints.getProducts);
      print(res.data);
      // List<Category> cats = await res.data.map((cat) {
      //   return Category.fromJson(cat);
      // }).toList();

      for (var element in res.data) {
        products.add(Product.fromJson(element));
        print(Product.fromJson(element));
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
    return products;
  }

  @override
  Future<List<Product>> loadCategoryProducts(int id) async {
    List<Product> products = [];
    print('loadProducts');
    try {
      final Response res = await Dio().get(Endpoints.getProducts);
      print(res.data);
      // List<Category> cats = await res.data.map((cat) {
      //   return Category.fromJson(cat);
      // }).toList();

      for (var element in res.data) {
        products.add(Product.fromJson(element));
        print(Product.fromJson(element));
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
    return products;
  }
}
