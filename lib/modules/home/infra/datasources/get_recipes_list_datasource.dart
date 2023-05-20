import 'package:cook_app/modules/home/infra/models/recipe_model.dart';

abstract class GetRecipeDatasource {
  Future<List<RecipeModel>> getRecipesList();
}
