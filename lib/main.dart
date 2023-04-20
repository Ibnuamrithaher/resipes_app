import 'package:flutter/material.dart';
import 'package:recipes_app/category_screen.dart';
import 'package:recipes_app/detail_food.dart';
import 'package:recipes_app/recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomePage(),
        '/recipes': (context) => const Recipe(),
        '/detail_food': (context) => const DetailFood(),
      },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Recipes",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: const CategoryScreen(),
    );
  }
}
