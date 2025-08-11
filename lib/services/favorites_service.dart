import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:welness/models/quote.dart';

class FavoritesService {
  static const String _favoritesKey = 'favorite_quotes';
  static List<Quote> _favoriteQuotes = [];

  static List<Quote> get favoriteQuotes => List.unmodifiable(_favoriteQuotes);

  static Future<void> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];

      _favoriteQuotes = favoritesJson
          .map((json) => Quote.fromJson(jsonDecode(json)))
          .toList();
    } catch (e) {
      _favoriteQuotes = [];
    }
  }

  static Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = _favoriteQuotes
          .map((quote) => jsonEncode(quote.toJson()))
          .toList();

      await prefs.setStringList(_favoritesKey, favoritesJson);
    } catch (e) {
      print('Error saving favorites: $e');
    }
  }

  static Future<bool> toggleFavorite(Quote quote) async {
    final index = _favoriteQuotes.indexWhere((fav) => fav.id == quote.id);

    if (index >= 0) {
      _favoriteQuotes.removeAt(index);
      await _saveFavorites();
      return false;
    } else {
      _favoriteQuotes.add(quote);
      await _saveFavorites();
      return true;
    }
  }

  static bool isFavorite(Quote quote) {
    return _favoriteQuotes.any((fav) => fav.id == quote.id);
  }

  static Future<void> removeFavorite(Quote quote) async {
    _favoriteQuotes.removeWhere((fav) => fav.id == quote.id);
    await _saveFavorites();
  }

  static Future<void> clearAllFavorites() async {
    _favoriteQuotes.clear();
    await _saveFavorites();
  }

  static int get favoritesCount => _favoriteQuotes.length;
}
