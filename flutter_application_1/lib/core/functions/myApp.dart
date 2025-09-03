import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/servecs/apiServes.dart';
import 'package:flutter_application_1/core/cubit/auth/authCubit.dart';
import 'package:flutter_application_1/core/cubit/recipe/labtopcubit.dart';
import 'package:flutter_application_1/core/screens/card/cardPage.dart';
import 'package:flutter_application_1/core/screens/favorite/favorite.dart';
import 'package:flutter_application_1/core/screens/home/RecipePage.dart';
import 'package:flutter_application_1/core/screens/profile/profile.dart';
import 'package:flutter_application_1/core/screens/regester/login.dart';
import 'package:flutter_application_1/core/widgets/nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(ApiService()),
        ),
        BlocProvider<RecipeCubit>(
          create: (_) => RecipeCubit(ApiService())..fetchRecipes(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: const Login(), 
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Home(),
    FavoritesPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
