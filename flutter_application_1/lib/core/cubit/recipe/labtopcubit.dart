import 'package:flutter_application_1/core/api/servecs/apiServes.dart';
import 'package:flutter_application_1/core/cubit/recipe/labtobstat.dart';
import 'package:flutter_application_1/core/model/labtob.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeCubit extends Cubit<RecipeState> {
  final ApiService apiService;

  RecipeCubit(this.apiService) : super(RecipeInitial());

  Future<void> fetchRecipes() async {
    try {
      emit(RecipeLoading());
      final List<Recipe> recipes = await apiService.getRecipes();
      emit(RecipeLoaded(recipes));
    } catch (e) {
      emit(RecipeError(e.toString()));
    }
  }

  
  void toggleFavorite(Recipe recipe) {
    if (state is RecipeLoaded) {
      final currentState = state as RecipeLoaded;
      final favorites = List<Recipe>.from(currentState.favorites);

      if (favorites.contains(recipe)) {
        favorites.remove(recipe);
      } else {
        favorites.add(recipe);
      }

      emit(currentState.copyWith(favorites: favorites));
    }
  }

  
  void toggleCart(Recipe recipe) {
    if (state is RecipeLoaded) {
      final currentState = state as RecipeLoaded;
      final cart = List<Recipe>.from(currentState.cart);

      if (cart.contains(recipe)) {
        cart.remove(recipe);
      } else {
        cart.add(recipe);
      }

      emit(currentState.copyWith(cart: cart));
    }
  }
}
