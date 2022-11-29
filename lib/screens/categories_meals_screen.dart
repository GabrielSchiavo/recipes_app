import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals_app/data/dummy_data.dart';
import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),

        // Altera a cor de fundo da statusbar e dos ícones
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.primary,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return Text(categoryMeals[index].title);
          }),
    );
  }
}
