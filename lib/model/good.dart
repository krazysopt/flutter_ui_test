class Good {

  final String id;

  final String name;

  final String price;

  /// image path
  final String image;

  /// description of good
  final String description;

  /// m date YYYY-MM-DD
  final String date;

  const Good({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.description = '',
    this.date = '',
  });
}