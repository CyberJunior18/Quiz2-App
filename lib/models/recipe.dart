class Recipe {
  const Recipe({required this.recipeName, required this.emojiRatings});

  final String recipeName;
  final List<String> emojiRatings;
}

Map<String, int> emojiToValue = {
  "😀":4,
  "🙂":3,
  "😐":2,
  "🙁":1,
};