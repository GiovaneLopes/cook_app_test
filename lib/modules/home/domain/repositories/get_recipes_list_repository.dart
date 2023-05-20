import 'package:cook_app/modules/home/domain/entities/recipe.dart';
import 'package:cook_app/modules/home/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class GetRecipeRepository {
  Future<Either<FailureHome, List<Recipe>>> getRecipesList();
}
