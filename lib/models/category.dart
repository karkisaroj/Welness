class Category {
  final String? id;
  final String name;
  final bool isQuotes;
  final bool isHealth;
  final DateTime createdAt;
  final String createdBy;

  Category({
    this.id,
    required this.name,
    required this.isQuotes,
    required this.isHealth,
    required this.createdAt,
    required this.createdBy,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isQuotes': isQuotes,
      'isHealth': isHealth,
      'createdAt': createdAt,
      'createdBy': createdBy,
    };
  }

  static Category fromMap(Map<String, dynamic> map, String id) {
    return Category(
      id: id,
      name: map['name'] ?? '',
      isQuotes: map['isQuotes'] ?? false,
      isHealth: map['isHealth'] ?? false,
      createdAt: map['createdAt']?.toDate() ?? DateTime.now(),
      createdBy: map['createdBy'] ?? 'unknown',
    );
  }
}
