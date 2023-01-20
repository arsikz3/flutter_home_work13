import 'package:flutter_home_work13_provider/repository/category_repository.dart';
import 'package:flutter_home_work13_provider/repository/product_repository.dart';
import 'package:provider/provider.dart';
import 'package:flutter_home_work13_provider/notifiers/init_change_notifier.dart';
import 'package:flutter_home_work13_provider/widgets/home_screen.dart';
import 'package:flutter_home_work13_provider/repository/speakers_repository.dart';
import 'package:flutter_home_work13_provider/repository/talks_repository.dart';
import 'package:flutter/material.dart';

void main() => runApp(const RatingProviderApp());

class RatingProviderApp extends StatelessWidget {
  const RatingProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => RatingAppState(
                  const ConstSpeakersRepository(),
                  const ConstTalksRepository(),
                  ConstCategoryRepository())),
        ],
        child: MaterialApp(
          title: 'E-Commerce',
          home: HomeScreen(),
        ));
  }
}
