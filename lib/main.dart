import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/models/settings.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/settings_screen.dart';

import '/utils/app_routes.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoritesMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoritesMeals.contains(meal)
          ? _favoritesMeals.remove(meal)
          : _favoritesMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoritesMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeData tema = ThemeData();

    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        useMaterial3: true,
        //Define a cor principal
        colorSchemeSeed: Colors.pink[800],

        // colorScheme: tema.colorScheme.copyWith(
        //   primary: const Color(0xFFBC004B),
        //   onPrimary: const Color(0xFFFFFFFF),
        //   primaryContainer: const Color(0xFFFFD9DE),
        //   onPrimaryContainer: const Color(0xFF400014),
        //   secondary: const Color(0xFF75565B),
        //   secondaryContainer: const Color(0xFFFFD9DE),
        //   onSecondaryContainer: const Color.fromARGB(255, 250, 221, 236),
        //   background: const Color(0xFFFFFBFF),
        //   onBackground: const Color(0xFF201A1B),
        //   outline: const Color(0xFF847375),
        //   shadow: const Color(0xFF000000),
        // ),

        canvasColor: const Color.fromARGB(255, 255, 251, 255),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoFlex',
              ),
            ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFBFF),
          titleTextStyle: TextStyle(
            color: Color(0xFF201A1B),
            fontFamily: 'RobotoFlex',
            fontSize: 18,
          ),
        ),
      ),

      // home: const CategoriesScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(_favoritesMeals),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.mealDetail: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.settings: (ctx) => SettingsScreen(settings, _filterMeals),
      },

      //Caso não encontre a rota especificada para uma tela, retorna a tela de categorias.
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return const CategoriesScreen();
        });
      },
    );
  }
}
