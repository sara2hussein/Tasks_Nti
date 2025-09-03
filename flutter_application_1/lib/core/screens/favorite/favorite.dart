import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cubit/recipe/labtopcubit.dart';
import 'package:flutter_application_1/core/cubit/recipe/labtobstat.dart';
import 'package:flutter_application_1/core/widgets/recipe_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorites"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoaded) {
            final favorites = state.favorites;

            if (favorites.isEmpty) {
              return const Center(child: Text("No favorites yet ",style: TextStyle(fontSize: 22)));
            }

            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final recipe = favorites[index];
                return RecipeCard(recipe: recipe);
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
