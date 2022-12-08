import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals_app/components/main_drawer.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;

  const TabsScreen(this.favoritesMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> ?_screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': const CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoritesMeals),
      },
    ];
  }

  // _selectScreen(int index) {
  //   setState(() {
  //     _selectedScreenIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens![_selectedScreenIndex]['title'] as String,
        ),

        // Altera a cor de fundo da statusbar e dos ícones
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.primary,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      drawer: const MainDrawer(),
      body: _screens![_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: NavigationBar(
        elevation: 1,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedScreenIndex = index;
          });
        },
        selectedIndex: _selectedScreenIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.category_rounded,
            ),
            icon: Icon(Icons.category_outlined),
            label: 'Categorias',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.star_rounded,
            ),
            icon: Icon(Icons.star_border_rounded),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
