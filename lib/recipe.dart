import 'package:flutter/material.dart';
import 'package:recipes_app/dummy_data.dart';
import 'package:recipes_app/models/food.dart';

class Recipe extends StatefulWidget {
  const Recipe({
    super.key,
  });

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsRecipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List<Food> filteredFood = dummyFood.where(
      (food) {
        return food.category.contains(argsRecipe['id']);
      },
    ).toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          argsRecipe['title'],
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: filteredFood.length,
          itemBuilder: (context, index) {
            final food = filteredFood[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/detail_food', arguments: {
                        'title': food.title,
                        'ingredients': food.ingredients
                      });
                    },
                    child: Container(
                      // margin: const EdgeInsets.only(bottom: 20),
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(food.imageUrl))),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer_outlined,
                                  color: Colors.red,
                                ),
                                Text(
                                  '${food.duration} mins',
                                  style: const TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFav = !isFav;
                                    food.isFavorite = isFav;
                                  });
                                  // print(isFav);
                                },
                                icon: Icon(
                                  food.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Colors.redAccent,
                                  size: 30,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
