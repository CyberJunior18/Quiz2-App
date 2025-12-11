import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeItem extends StatefulWidget {
  final Recipe recipe;
  final int index;
  final void Function(int, String) onSelectRating;

  const RecipeItem({
    super.key,
    required this.recipe,
    required this.index,
    required this.onSelectRating,
  });

  @override
  State<RecipeItem> createState() => _RecipeItemState();
}

class _RecipeItemState extends State<RecipeItem> {
  void rate(int value) {
    widget.onSelectRating(value);
  }

  Map<String, int> emojiToValue = {"😀": 4, "🙂": 3, "😐": 2, "🙁": 1};

  @override
  Widget build(BuildContext context) {
    String recipeName = widget.recipe.recipeName;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.index}. $recipeName",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),
          Row(
            spacing: 50,
            children: [
              ...widget.recipe.emojiRatings.map((e) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        rate(emojiToValue[e], e);
                      },
                      child: Text(e),
                    ),
                  ],
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
