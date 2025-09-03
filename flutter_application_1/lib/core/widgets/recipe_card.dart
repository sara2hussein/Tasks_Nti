import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/model/labtob.dart';
import 'package:flutter_application_1/core/cubit/recipe/labtopcubit.dart';
import 'package:flutter_application_1/core/cubit/recipe/labtobstat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(
      builder: (context, state) {
        final isFavorite = state is RecipeLoaded &&
            state.favorites.contains(recipe);

        final inCart = state is RecipeLoaded &&
            state.cart.contains(recipe); // ✅ cart

        return Card(
          margin: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// --------- صورة + زرار المفضلة ----------
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: Stack(
                  children: [
                    Image.network(
                      recipe.image,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black45,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.white,
                          ),
                          onPressed: () {
                            context
                                .read<RecipeCubit>()
                                .toggleFavorite(recipe);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// --------- البيانات ----------
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Rating
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Colors.orange, size: 22),
                        const SizedBox(width: 5),
                        Text(recipe.rating.toString(),
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // وقت + سيرفنج
                    Row(
                      children: [
                        const Icon(Icons.timer,
                            size: 20, color: Colors.grey),
                        const SizedBox(width: 5),
                        Text(
                          "${recipe.prepTimeMinutes + recipe.cookTimeMinutes} min",
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(width: 20),
                        const Icon(Icons.people,
                            size: 20, color: Colors.grey),
                        const SizedBox(width: 5),
                        Text(
                          "${recipe.servings} servings",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    /// --------- زرار Add to Cart ----------
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          inCart ? Icons.shopping_cart : Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                        label: Text(
                          inCart ? "Added to Cart" : "Add to Cart",
                          style: const TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              inCart ? Colors.green : Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          context.read<RecipeCubit>().toggleCart(recipe);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
