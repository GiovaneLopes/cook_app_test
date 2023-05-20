class Recipe {
  final String name;
  final String cookDuration;
  final List<String> ingredients;
  final String image;
  final String methodOfPreparation;

  Recipe(
      {required this.name,
      required this.cookDuration,
      required this.ingredients,
      required this.image,
      required this.methodOfPreparation});
}
