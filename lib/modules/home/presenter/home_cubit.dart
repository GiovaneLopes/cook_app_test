import 'package:cook_app/modules/home/domain/entities/recipe.dart';
import 'package:cook_app/modules/home/domain/usecases/get_recipes_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetRecipesListImpl getRecipesListImpl;
  HomeCubit(this.getRecipesListImpl) : super(HomeLoadingState());

  void initialize() async {
    emit(HomeLoadingState());
    final usecaseResponse = await getRecipesListImpl();
    usecaseResponse.fold((l) => emit(HomeErrorState()),
        (recipeList) => emit(HomeSuccessState(recipeList)));
  }
}

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Recipe> recipeList;

  HomeSuccessState(this.recipeList);
}

class HomeErrorState extends HomeState {}
