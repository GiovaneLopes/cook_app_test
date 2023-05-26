import 'package:cook_app/modules/home/presenter/home_cubit.dart';
import 'package:cook_app/shared/resources/fonts.dart';
import 'package:cook_app/shared/ui/bottom_menu.dart';
import 'package:cook_app/shared/ui/recipe_card.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = Modular.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
    cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Icon(
            Icons.arrow_back,
            color: Colors.transparent,
          ),
          Text(
            'Home',
            style: TextStyle(
              fontFamily: Fonts.ubuntuRegular,
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: Colors.grey.shade800,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FeatherIcons.search,
              color: Colors.grey.shade800,
            ),
          ),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, top: 12),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Suggestions',
                  style: TextStyle(
                    fontFamily: Fonts.ubuntuRegular,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) {
                    if (state.runtimeType == HomeLoadingState) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      ));
                    }
                    if (state.runtimeType == HomeErrorState) {
                      return const Text('Erro');
                    }

                    final successState = state as HomeSuccessState;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: successState.recipeList.length,
                        itemBuilder: (context, value) {
                          return RecipeCard(
                              recipe: successState.recipeList[value]);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            const BottomMenu(),
          ],
        ),
      ),
    );
  }
}
