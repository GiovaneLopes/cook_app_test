import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cook_app/modules/home/domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  RecipeModel({
    required super.name,
    required super.cookDuration,
    required super.ingredients,
    required super.image,
    required super.methodOfPreparation,
  });

  RecipeModel copyWith({
    String? name,
    int? cookDuration,
    List<String>? ingredients,
    String? image,
    List<String>? methodOfPreparation,
  }) {
    return RecipeModel(
      name: name ?? this.name,
      cookDuration: cookDuration ?? this.cookDuration,
      ingredients: ingredients ?? this.ingredients,
      image: image ?? this.image,
      methodOfPreparation: methodOfPreparation ?? this.methodOfPreparation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cookDuration': cookDuration,
      'ingredients': ingredients,
      'image': image,
      'methodOfPreparation': methodOfPreparation,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      name: map['item']['name'] ?? '',
      cookDuration: map['item']['total_time_minutes'] ?? 0,
      ingredients:
          RecipeModelExtension.getIngredientsList(map['item']['sections']),
      image: map['item']['thumbnail_url'] ?? '',
      methodOfPreparation:
          RecipeModelExtension.prepareMethod(map['item']['instructions']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromJson(String source) =>
      RecipeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RecipeModel(name: $name, cookDuration: $cookDuration, ingredients: $ingredients, image: $image, methodOfPreparation: $methodOfPreparation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecipeModel &&
        other.name == name &&
        other.cookDuration == cookDuration &&
        listEquals(other.ingredients, ingredients) &&
        other.image == image &&
        other.methodOfPreparation == methodOfPreparation;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        cookDuration.hashCode ^
        ingredients.hashCode ^
        image.hashCode ^
        methodOfPreparation.hashCode;
  }
}

extension RecipeModelExtension on RecipeModel {
  static List<String> getIngredientsList(List? sections) {
    final ingredientList = <String>[];
    if (sections != null) {
      sections
          .map((section) => section['components'].map((component) {
                ingredientList.add(component['raw_text']);
              }).toList())
          .toList();
    }
    return ingredientList;
  }

  static List<String> prepareMethod(List? prepareMethods) {
    final preparationItens = <String>[];
    if (prepareMethods != null) {
      prepareMethods
          .map((method) => preparationItens.add(method['display_text']))
          .toList();
    }
    return preparationItens;
  }
}
