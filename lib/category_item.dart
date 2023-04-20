import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String images;
  const CategoryItem(
      {super.key, required this.id, required this.title, required this.images});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/recipes', arguments: {
          'id': id,
          'title': title,
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(64, 0, 0, 0),
                  blurRadius: 8,
                  // spreadRadius: 10,
                  offset: Offset(0, 5))
            ],
            color: Colors.grey,
            image: DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                image: NetworkImage(images))),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.2, 1])),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
