import 'package:flutter/material.dart';

import '/utils/app_routes.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: tema.colorScheme.copyWith(
          primary: const Color(0xFFBC004B),
          onPrimary: const Color(0xFFFFFFFF),
          primaryContainer: const Color(0xFFFFD9DE),
          onPrimaryContainer: const Color(0xFF400014),
          secondary: const Color(0xFF75565B),
          secondaryContainer: const Color(0xFFFFD9DE),
          background: const Color(0xFFFFFBFF),
          onBackground: const Color(0xFF201A1B),
          outline: const Color(0xFF847375),
          shadow: const Color(0xFF000000),
        ),
        // canvasColor: const Color.fromRGBO(255, 254, 229, 1),
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
      routes: {
        AppRoutes.home: (ctx) => const CategoriesScreen(),
        AppRoutes.categoriesMeals: (ctx) => const CategoriesMealsScreen(),
      },
    );
  }
}
