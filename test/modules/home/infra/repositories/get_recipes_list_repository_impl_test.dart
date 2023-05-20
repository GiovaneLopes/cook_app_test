import 'package:cook_app/modules/home/infra/datasources/get_recipes_list_datasource.dart';
import 'package:cook_app/modules/home/infra/models/recipe_model.dart';
import 'package:cook_app/modules/home/infra/repositories/get_recipes_list_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_recipes_list_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetRecipeDatasource>()])
main() {
  final datasource = MockGetRecipeDatasource();
  final repository = GetRecipesListRepositoryImpl(datasource);
  test('should return a Recipe list', () async {
    when(datasource.getRecipesList()).thenAnswer((_) async => <RecipeModel>[]);
    final result = await repository.getRecipesList();
    expect(result.isRight(), true);
  });

  test('should return a Exception if datasource fail', () async {
    when(datasource.getRecipesList()).thenThrow(Exception());
    final result = await repository.getRecipesList();
    expect(result.fold(id, id), isA<Exception>());
  });
}
