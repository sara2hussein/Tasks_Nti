import 'package:creativa/tabs/home_screen.dart';
import 'package:creativa/tabs/result_page.dart';
import 'package:creativa/tabs/screen2.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.routeName,
      routes: {
       Home.routeName:(context) => const Home(),
       Screen2.routeName:(context) => const Screen2(),
       ResultCardBlur.routeName:(context) => const ResultCardBlur()
      },
    );
  }
}