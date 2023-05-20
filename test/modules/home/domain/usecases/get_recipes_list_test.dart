import 'package:cook_app/modules/home/domain/entities/recipe.dart';
import 'package:cook_app/modules/home/domain/repositories/get_recipes_list_repository.dart';
import 'package:cook_app/modules/home/domain/usecases/get_recipes_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_recipes_list_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetRecipeRepository>()])
main() {
  final repository = MockGetRecipeRepository();
  final usecase = GetRecipesListImpl(repository);
  test('should return a Recipe list', () async {
    when(repository.getRecipesList())
        .thenAnswer((_) async => const Right(<Recipe>[]));
    final result = await usecase();
    expect(result.isRight(), true);
  });
}
