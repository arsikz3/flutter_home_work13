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
    try {
      final Response res = await Dio().get(Endpoints.getProducts);

      for (var element in res.data) {
        products.add(Product.fromJson(element));
      }
    } catch (e) {
      rethrow;
    }
    return products;
  }

  @override
  Future<List<Product>> loadCategoryProducts(int id) async {
    List<Product> products = [];
    try {
      final Response res = await Dio().get(Endpoints.getProducts);

      for (var element in res.data) {
        products.add(Product.fromJson(element));
      }
    } catch (e) {
      rethrow;
    }
    return products;
  }
}
