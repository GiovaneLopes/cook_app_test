import 'package:cook_app/modules/home/domain/errors/errors.dart';
import 'package:cook_app/modules/home/domain/entities/recipe.dart';
import 'package:cook_app/modules/home/domain/repositories/get_recipes_list_repository.dart';
import 'package:cook_app/modules/home/infra/datasources/get_recipes_list_datasource.dart';
import 'package:dartz/dartz.dart';

class GetRecipesListRepositoryImpl implements GetRecipeRepository {
  final GetRecipeDatasource getRecipeDatasource;

  GetRecipesListRepositoryImpl(this.getRecipeDatasource);
  @override
  Future<Either<FailureHome, List<Recipe>>> getRecipesList() async {
    try {
      final result = await getRecipeDatasource.getRecipesList();
      return Right(result);
    } catch (e) {
      return Left(DatasourceFailure());
    }
  }
}
