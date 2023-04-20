class Food {
  final String id;
  final String title;
  final String category;
  final List<String> ingredients;
  final int duration;
  final String imageUrl;
  bool isFavorite;

  Food(
      {required this.id,
      required this.title,
      required this.category,
      required this.ingredients,
      required this.duration,
      required this.imageUrl,
      this.isFavorite = false});
}
