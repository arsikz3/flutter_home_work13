import 'package:flutter/material.dart';
import 'package:flutter_home_work13_provider/models/category.dart';
import 'package:flutter_home_work13_provider/models/order.dart';
import 'package:flutter_home_work13_provider/models/product.dart';
import 'package:flutter_home_work13_provider/repository/category_repository.dart';
import 'package:flutter_home_work13_provider/repository/order_repository.dart';
import 'package:flutter_home_work13_provider/repository/product_repository.dart';
import 'package:flutter_home_work13_provider/models/app_tab.dart';

class OrderAppState with ChangeNotifier {
  final OrderRepository _ordersRepositorys;
  List<Order> orders = [];

  OrderAppState(this._ordersRepositorys);

  void getOrders() async {
    orders = await _ordersRepositorys.loadOrder();
    notifyListeners();
  }

  Future<List<Order>> loadOrders() async {
    return await _ordersRepositorys.loadOrder();
  }
}

class ProductAppState with ChangeNotifier {
  final ProductRepository _productsRepository;
  List<Product> products = [];

  bool get isLoaded => products.isNotEmpty;
  ProductAppState(this._productsRepository);

  void getProducts() async {
    products = await _productsRepository.loadProducts();
    notifyListeners();
  }

  void getCategoryProducts(int id) async {
    products = await _productsRepository.loadCategoryProducts(id);
    notifyListeners();
  }
}

class RatingAppState with ChangeNotifier {
  final OrderRepository _ordersRepository;
  final CategoriesRepository _categoriesRepository;
  List<Order> orders = [];
  List<Category> categories = [];
  List<Product> products = [];

  int activeTabIndex = AppTab.categories.index;

  bool get isLoaded => categories.isNotEmpty && categories.isNotEmpty;

  RatingAppState(this._categoriesRepository, this._ordersRepository) {
    _initCategories();
    _initOrders();
  }

  void _initCategories() async {
    categories = await _categoriesRepository.loadCategories();
    notifyListeners();
  }

  void _initOrders() async {
    orders = await _ordersRepository.loadOrder();
    notifyListeners();
  }

  void updateTab(int index) {
    activeTabIndex = index;
    notifyListeners();
  }

  void getCategoryProducts(int id) async {
    products = await _categoriesRepository.loadCategyProducts(id);
    notifyListeners();
  }

  Future<List<Product>> getCatProducts(int id) async {
    products = await _categoriesRepository.loadCategyProducts(id);
    return products;
    // notifyListeners();
  }

  void addOrder(Product product, int quant) {
    _ordersRepository.saveToOrder(product, quant);
    notifyListeners();
  }
}

class AppCountState with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    counter--;
    notifyListeners();
  }
}
