import 'package:cook_app/modules/home/external/datasources/tasty_datasource.dart';
import 'package:cook_app/modules/home/infra/models/recipe_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

import '../utils/tasty_api_response_mock.dart';

void main() {
  final dio = Dio(BaseOptions());
  final adapterDio = DioAdapter(dio: dio);
  final datasource = TastyDatasource(dio);

  setUp(() => dotenv.load(fileName: '.env'));

  test('should return RecipeModel List', () async {
    when(
      adapterDio.onGet(
        path,
        (request) =>
            request.reply(200, response, delay: const Duration(seconds: 1)),
      ),
    );

    final result = await datasource.getRecipesList();
    expect(result, isA<List<RecipeModel>>());
  });
}
