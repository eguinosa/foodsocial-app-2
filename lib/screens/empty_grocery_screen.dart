// Gelin Eguinosa
// 2023

import 'package:flutter/material.dart';


class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace and add layout widgets.
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add empty image.
            // 1
            Flexible(
              // 2
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/foodsocial_assets/empty_list.png'),
              ),
            ),
            // Add empty screen title.
            Text(
              'No Groceries',
              style: Theme.of(context).textTheme.headline6,
            ),
            // Add empty screen subtitle.
            const SizedBox(height: 16.0),
            const Text(
              'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            // Add browse recipes button.
            MaterialButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.green,
              onPressed: () {
                // TODO: Go to Recipes Tab.
              },
              child: const Text('Browse Recipes'),
            )
          ],
        ),
      ),
    );
  }
}
