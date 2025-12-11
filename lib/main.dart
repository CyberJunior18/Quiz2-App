import 'package:flutter/material.dart';
import 'package:mostafa_hammadi/recipe_app.dart';

void main() {
  runApp(MaterialApp(home: RecipeApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
