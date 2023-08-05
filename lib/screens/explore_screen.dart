// Gelin Eguinosa
// 2023

import 'dart:developer';
import 'package:flutter/material.dart';

import '../api/mock_foodsocial_service.dart';
import '../components/components.dart';
import '../models/models.dart';


class ExploreScreen extends StatefulWidget {

  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ScrollController controller;
  final mockService = MockFoodSocialService();

  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 1
    return FutureBuilder(
      // 2
      future: mockService.getExploreData(),
      // 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot){
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          return ListView(
            // 6
            scrollDirection: Axis.vertical,
            controller: controller,
            children: [
              // 7
              TodayRecipeListView(
                  recipes: snapshot.data?.todayRecipes ?? [],
              ),
              // 8
              const SizedBox(height: 16),
              // 9
              // TODO: Replace this with FriendPostListView.
              FriendPostListView(
                friendPosts: snapshot.data?.friendPosts ?? [],
              ),
            ],
          );
        } else {
          // 10
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  scrollListener() {
    if (controller.offset <= controller.position.minScrollExtent &&
        !controller.position.outOfRange) {
      log("We are at the top of the ListView in the Explore Screen.");
    } else if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      log("We are at the bottom of the ListView in the Explore Screen.");
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
