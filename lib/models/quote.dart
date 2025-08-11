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
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      text: json['quote']?.toString() ?? '',
      author: json['author']?.toString() ?? 'Unknown',
      category: json['category']?.toString() ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quote': text,
      'author': author,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
