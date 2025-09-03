import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/cubit/recipe/labtopcubit.dart';
import 'package:flutter_application_1/core/cubit/recipe/labtobstat.dart';
import 'package:flutter_application_1/core/model/labtob.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart "),
         centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoaded) {
            final List<Recipe> cart = state.cart;

            if (cart.isEmpty) {
              return const Center(
                child: Text(
                  " Cart is empty",
                  style: TextStyle(fontSize: 22),
                ),
              );
            }

            return ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final recipe = cart[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(
                      recipe.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(recipe.name),
                    subtitle: Text(
                      "${recipe.servings} servings • ${recipe.prepTimeMinutes + recipe.cookTimeMinutes} min",
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () {
                        context.read<RecipeCubit>().toggleCart(recipe);
                      },
                    ),
                  ),
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
