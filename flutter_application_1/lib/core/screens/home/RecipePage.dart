import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cubit/recipe/labtobstat.dart';
import 'package:flutter_application_1/core/cubit/recipe/labtopcubit.dart';
import 'package:flutter_application_1/core/screens/home/showdetails.dart';
import 'package:flutter_application_1/core/widgets/recipe_card.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  static const String routeName = '/recipe';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecipeError) {
            return Center(child: Text("Error: ${state.message}"));
          } else if (state is RecipeLoaded) {
            final recipes = state.recipes;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final r = recipes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowDetails(recipe: r),
                      ),
                    );
                  },
                  child: RecipeCard(recipe: r),
                );
              },
            );
          }
          return const Center(child: Text("No data"));
        },
      ),
    );
  }
}
