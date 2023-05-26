import 'package:cook_app/modules/home/domain/usecases/get_recipes_list.dart';
import 'package:cook_app/modules/home/external/datasources/tasty_datasource.dart';
import 'package:cook_app/modules/home/infra/repositories/get_recipes_list_repository_impl.dart';
import 'package:cook_app/modules/home/presenter/home_cubit.dart';
import 'package:cook_app/modules/home/presenter/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => Dio()),
        Bind.lazySingleton((i) => GetRecipesListImpl(i())),
        Bind.lazySingleton((i) => GetRecipesListRepositoryImpl(i())),
        Bind.lazySingleton((i) => TastyDatasource(i())),
        Bind.lazySingleton((i) => HomeCubit(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        )
      ];
}
