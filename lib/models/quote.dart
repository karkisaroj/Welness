class Quote {
  final int id;
  final String text;
  final String author;
  final String category;
  final DateTime createdAt;

  Quote({
    required this.id,
    required this.text,
    required this.author,
    required this.category,
    required this.createdAt,
  });

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['id'] is int
          ? map['id']
          : int.tryParse(map['id'].toString()) ?? 0,
      text: map['quote']?.toString() ?? '',
      author: map['author']?.toString() ?? 'Unknown',
      category: map['category']?.toString() ?? '',
      createdAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quote': text,
      'author': author,
      'category': category,
      'createdAt': createdAt,
    };
  }
}
