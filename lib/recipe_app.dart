import 'package:flutter/material.dart';
import 'data/recipes.dart';
import 'models/recipe.dart';
import 'screens/recipes_screen.dart';
import 'screens/result_screen.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  String currentScreen = "recipes-screen";

  void _onSubmit() {
    currentScreen = "results-screen";
  }

  double get averageRating {
    return 0.1;
  }

  void _onSelectRating (int rating, String emoji) {

  }

  // selectedRatings is initially filled with empty strings because the rating is not yet given.
  List<String> selectedRatings = List.filled(recipes.length, "");

  String topRecipeName() {
    int bestValue = -1;
    String bestName = "";

    for (int i = 0; i < recipes.length; i++) {
      if (selectedRatings[i].isNotEmpty) {
        int value = emojiToValue[selectedRatings[i]]!;
        if (value > bestValue) {
          bestValue = value;
          bestName = recipes[i].recipeName;
        }
      }
    }
    return bestName;
  }

  void _restart() {
    setState(() {
      selectedRatings = List.filled(recipes.length, "");
      currentScreen = "recipes-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? screenWidget;
    if (currentScreen == "recipes-screen") {
      screenWidget = RecipesScreen(onSelectRating: _onSelectRating, onSubmit: _onSubmit,);
    }else if(currentScreen == "results-screen"){
      String top = topRecipeName();
      screenWidget = ResultScreen(averageRating: averageRating, topRecipeName: top, onRestart: _restart);
    }

    return Scaffold(
      body: screenWidget,
      backgroundColor: const Color.fromARGB(255, 73, 168, 122),
    );
  }
}
