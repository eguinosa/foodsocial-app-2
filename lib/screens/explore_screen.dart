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
    // 1
    return FutureBuilder(
      // 2
      future: mockService.getExploreData(),
      // 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot){
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          final recipes = snapshot.data?.todayRecipes ?? [];
          // TODO: Replace this with TodayRecipeListView
          return Center(
            child: Container(
              child: const Text('Show TodayRecipeListView'),
            ),
          );
        } else {
          // 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}