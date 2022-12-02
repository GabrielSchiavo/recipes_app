import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals_app/components/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),

        // Altera a cor de fundo da statusbar e dos ícones
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.primary,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text('Configurações'),
      ),
    );
  }
}
