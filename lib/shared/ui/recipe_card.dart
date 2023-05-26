import 'package:cook_app/modules/home/domain/entities/recipe.dart';
import 'package:cook_app/modules/home/presenter/utils/cook_duration_converter.dart';
import 'package:cook_app/shared/resources/fonts.dart';
import 'package:cook_app/shared/ui/like_button.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2, right: 2, bottom: 18),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 1),
            blurRadius: 2,
            spreadRadius: 1,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 102,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      recipe.image,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  LikeButton(
                    isLiked: false,
                  )
                ],
              ),
            ],
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  style: const TextStyle(
                    fontFamily: Fonts.ubuntuRegular,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                if (recipe.cookDuration > 0)
                  Row(
                    children: [
                      const Icon(
                        FeatherIcons.clock,
                        size: 15,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        CookDurationConverter.cookDurationInHours(
                            recipe.cookDuration),
                        style: const TextStyle(
                          fontFamily: Fonts.ubuntuRegular,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
