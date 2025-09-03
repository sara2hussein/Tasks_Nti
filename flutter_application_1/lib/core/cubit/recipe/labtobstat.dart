import 'package:flutter_application_1/core/model/labtob.dart';

abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<Recipe> recipes;
  final List<Recipe> favorites;
  final List<Recipe> cart; 

  RecipeLoaded(
    this.recipes, {
    this.favorites = const [],
    this.cart = const [], 
  });

  RecipeLoaded copyWith({
    List<Recipe>? recipes,
    List<Recipe>? favorites,
    List<Recipe>? cart,
  }) {
    return RecipeLoaded(
      recipes ?? this.recipes,
      favorites: favorites ?? this.favorites,
      cart: cart ?? this.cart,
    );
  }
}

class RecipeError extends RecipeState {
  final String message;
  RecipeError(this.message);
}
