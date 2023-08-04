// Gelin Eguinosa
// 2023

import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  final List<ExploreRecipe> recipes;

  const TodayRecipeListView({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipes of the Day 🍳',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 16),
          Container(
            height: 400,
            // Add ListView Here.
            // 1
            color: Colors.transparent,
            // 2
            child: ListView.separated(
              // 3
              scrollDirection: Axis.horizontal,
              // 4
              itemCount: recipes.length,
              // 5
              itemBuilder: (context, index) {
                // 6
                final recipe = recipes[index];
                return buildCard(recipe);
              },
              // 7
              separatorBuilder: (context, index) {
                // 8
                return const SizedBox(width: 16);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Add buildCard() widget here.
  Widget buildCard(ExploreRecipe recipe) {
    if(recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception("This card doesn't exist yet");
    }

  }
}
