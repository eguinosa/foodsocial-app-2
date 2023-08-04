// Gelin Eguinosa
// 2023

import 'package:flutter/material.dart';

import '../api/mock_foodsocial_service.dart';
import '../components/components.dart';
import '../models/models.dart';


class ExploreScreen extends StatelessWidget {
  final mockService = MockFoodSocialService();

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Add Today RecipeListView FutureBuilder.
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          // Replace this with TodayRecipeListView
          return TodayRecipeListView(recipes: recipes);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
