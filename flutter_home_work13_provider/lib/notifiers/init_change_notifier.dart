import 'package:flutter/material.dart';
import 'package:flutter_home_work13_provider/models/category.dart';
import 'package:flutter_home_work13_provider/models/product.dart';
import 'package:flutter_home_work13_provider/models/speaker.dart';
import 'package:flutter_home_work13_provider/models/talk.dart';
import 'package:flutter_home_work13_provider/repository/category_repository.dart';
import 'package:flutter_home_work13_provider/repository/product_repository.dart';
import 'package:flutter_home_work13_provider/repository/speakers_repository.dart';
import 'package:flutter_home_work13_provider/repository/talks_repository.dart';
import 'package:flutter_home_work13_provider/models/filter.dart';
import 'package:flutter_home_work13_provider/models/app_tab.dart';

class ProductAppState with ChangeNotifier {
  final ProductRepository _productsRepository;
  List<Product> products = [];

  bool get isLoaded => products.isNotEmpty;
  ProductAppState(this._productsRepository) {
    // _getProducts();
  }

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
  final SpeakersRepository _speakersRepository;
  final TalksRepository _talksRepository;
  final CategoriesRepository _categoriesRepository;
  List<ScheduledTalk> talks = [];
  List<Speaker> speakers = [];
  List<Category> categories = [];
  List<Product> products = [];

  Filter? activeFilter;
  int activeTabIndex = AppTab.speakers.index;

  bool get isLoaded => talks.isNotEmpty && speakers.isNotEmpty;

  List<Speaker> get filteredSpeakers => speakers.where((s) {
        if (activeFilter == Filter.top) {
          return s.rating == 5;
        } else if (activeFilter == Filter.unrated) {
          return s.rating == null;
        } else {
          return true;
        }
      }).toList();

  RatingAppState(this._speakersRepository, this._talksRepository,
      this._categoriesRepository) {
    _initSpeakers();
    _initTalks();
    _initCategories();
  }

  void _initCategories() async {
    categories = await _categoriesRepository.loadCategories();
    notifyListeners();
  }

  void _initSpeakers() async {
    speakers = await _speakersRepository.loadSpeakers();
    notifyListeners();
  }

  void _initTalks() async {
    talks = await _talksRepository.loadTalks();
    notifyListeners();
  }

  void updateSpeaker(Speaker speaker) {
    _speakersRepository.saveSpeaker(speaker);
    speakers = speakers.map((s) => s.id == speaker.id ? speaker : s).toList();
    notifyListeners();
  }

  void updateTalk(ScheduledTalk talk) {
    _talksRepository.saveTalk(talk);
    talks = talks.map((t) => t.id == talk.id ? talk : t).toList();
    notifyListeners();
  }

  void updateFilter(Filter filter) {
    activeFilter = filter;
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
}
