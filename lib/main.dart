// Gelin Eguinosa
// 2023

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'foodsocial_theme.dart';
import 'home.dart';
import 'models/models.dart';


void main() {
  runApp(const FoodSocial2());
}


class FoodSocial2 extends StatelessWidget {
  const FoodSocial2({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FoodSocialTheme.light();

    return MaterialApp(
      theme: theme,
      title: 'Foodsocial 2',
      // Replace this with MultiProvider.
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          // Add GroceryManager Provider.
          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],
        child: const Home(),
      ),
    );
  }
}

