import 'package:cook_app/modules/home/domain/entities/recipe.dart';
import 'package:cook_app/modules/home/domain/errors/errors.dart';
import 'package:cook_app/modules/home/domain/repositories/get_recipes_list_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetRecipesList {
  Future<Either<FailureHome, List<Recipe>>> call();
}

class GetRecipesListImpl implements GetRecipesList {
  final GetRecipeRepository getRecipeRepository;

  GetRecipesListImpl(this.getRecipeRepository);
  @override
  Future<Either<FailureHome, List<Recipe>>> call() async {
    return await getRecipeRepository.getRecipesList();
  }
}
