import 'package:cook_app/modules/home/domain/errors/errors.dart';
import 'package:cook_app/modules/home/infra/datasources/get_recipes_list_datasource.dart';
import 'package:cook_app/modules/home/infra/models/recipe_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TastyDatasource extends GetRecipeDatasource {
  final Dio dio;

  TastyDatasource(this.dio);
  late String apiKey;

  @override
  Future<List<RecipeModel>> getRecipesList() async {
    apiKey = dotenv.get('TASTY_API_KEY');
    final response = await dio.get('https://tasty.p.rapidapi.com/feeds/list',
        queryParameters: {
          'size': '10',
          'timezone': '-0300',
          'vegetarian': 'false',
          'from': '0'
        },
        options: Options(method: 'GET', headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
        }));
    if (response.statusCode == 200) {
      final map = response.data as Map<String, dynamic>;
      final list = <RecipeModel>[];
      map.forEach((key, value) {
        value.map((result) {
          if (result['type'] == 'item') {
            final recipe = RecipeModel.fromMap(result);
            list.add(recipe);
          }
        }).toList();
      });
      return list;
    } else {
      throw DatasourceFailure();
    }
  }
}
