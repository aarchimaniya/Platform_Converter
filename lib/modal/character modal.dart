class Book {
  final String name;
  final String actor;
  final String house;
  final String patronus;
  final String price;
  final String imagePath;
  final List<String> summaries;

  Book({
    required this.name,
    required this.actor,
    required this.house,
    required this.patronus,
    required this.price,
    required this.imagePath,
    required this.summaries,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      name: json['name'],
      actor: json['actor'],
      house: json['house'],
      patronus: json['patronus'],
      price: json['price'],
      imagePath: json['imagePath'],
      summaries: List<String>.from(json['summaries']),
    );
  }
}
