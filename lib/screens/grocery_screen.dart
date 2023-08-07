// Gelin Eguinosa
// 2023

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'empty_grocery_screen.dart';
import 'grocery_item_screen.dart';
import '../models/models.dart';


class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Add a scaffold widget.
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Present GroceryItemScreen
          // 1
          final manager = Provider.of<GroceryManager>(context, listen: false);
          // 2
          Navigator.push(
            context,
            // 3 
            MaterialPageRoute(
              // 4
              builder: (context) => GroceryItemScreen(
                // 5
                onCreate: (item) {
                  // 6
                  manager.addItem(item);
                  // 7
                  Navigator.pop(context);
                },
                // 8
                onUpdate: (item) {},
              ),
            ),
          );
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  // Add buildGroceryScreen.
  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(
      builder: (context, manager, child) {
        if (manager.groceryItems.isNotEmpty) {
          // TODO: Add GroceryListScreen.
          return Container(color: Colors.deepPurpleAccent);
        } else {
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
