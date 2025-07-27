class AppUser {
  final String? id;
  final String email;
  final String userType;
  final List<String> preferences;
  final DateTime createdAt;

  AppUser({
    this.id,
    required this.email,
    required this.userType,
    required this.preferences,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'userType': userType,
      'preferences': preferences,
      'createdAt': createdAt,
    };
  }

  static AppUser fromMap(Map<String, dynamic> map, String id) {
    var preferencesData = map['preferences'];

    List<String> preferencesList = [];
    if (preferencesData != null) {
      if (preferencesData is List) {
        preferencesList = preferencesData
            .map((item) => item.toString())
            .toList();
      }
    }

    return AppUser(
      id: id,
      email: map['email'] ?? '',
      userType: map['userType'] ?? 'user',
      preferences: preferencesList,
      createdAt: _parseDateTime(map['createdAt']),
    );
  }

  static DateTime _parseDateTime(dynamic dateValue) {
    if (dateValue == null) {
      return DateTime.now();
    }

    if (dateValue is DateTime) {
      return dateValue;
    }

    if (dateValue.runtimeType.toString() == 'Timestamp') {
      return dateValue.toDate();
    }

    if (dateValue is String) {
      try {
        return DateTime.parse(dateValue);
      } catch (e) {
        return DateTime.now();
      }
    }

    return DateTime.now();
  }

  bool get isAdmin => userType == 'admin';
  bool get isUser => userType == 'user';
}
