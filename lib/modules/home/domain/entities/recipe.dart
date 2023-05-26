class Recipe {
  final String name;
  final int cookDuration;
  final List<String> ingredients;
  final String image;
  final List<String> methodOfPreparation;

  Recipe(
      {required this.name,
      required this.cookDuration,
      required this.ingredients,
      required this.image,
      required this.methodOfPreparation});
}
