// Gelin Eguinosa
// 2023

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'screens/explore_screen.dart';
import 'screens/recipes_screen.dart';
import 'screens/grocery_screen.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}


class HomeState extends State<Home> {

  static List<Widget> pages = <Widget>[
    // Replace with Explore Screen.
    ExploreScreen(),
    // Replace with Recipes Screen.
    RecipesScreen(),
    // Replace with Grocery Screen.
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Wrap inside a Consumer Widget.
    // 1
    return Consumer<TabManager>(
        builder: (context, tabManager, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Food Social 2",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            // 2
            // TODO: Replace body.
            body: pages[tabManager.selectedTab],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
              // 3
              currentIndex: tabManager.selectedTab,
              onTap: (index) {
                // 4
                tabManager.goToTab(index);
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Recipes',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'To Buy',
                ),
              ],
            ),
          );
        }
    );
  }
}
