import 'package:flutter/material.dart';

class DetailFood extends StatelessWidget {
  const DetailFood({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsFood =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List<String> ingredients = argsFood['ingredients'];
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
      child: Column(
        children: [
          Text(
            argsFood['title'],
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Ingedients',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text('${ingredients.length.toString()} items'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                final ing = ingredients[index];
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text(ing),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
