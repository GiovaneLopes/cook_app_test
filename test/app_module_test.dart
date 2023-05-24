import 'package:cook_app/app_module.dart';
import 'package:cook_app/modules/home/domain/usecases/get_recipes_list.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

main() {
  initModule(AppModule());
  test('Deve recuperar o usecase sem erro', () {
    final usecase = Modular.get<GetRecipesList>();

    expect(usecase, isA<GetRecipesList>());
  });
}
