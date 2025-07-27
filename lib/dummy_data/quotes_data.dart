import 'package:welness/models/quote.dart';

class QuotesData {
  static List<Map<String, dynamic>> quotesDummyList = [
    {
      "id": 1,
      "quote": "The only way to do great work is to love what you do.",
      "author": "Steve Jobs",
      "category": "Letting go",
    },
    {
      "id": 2,
      "quote": "Don't watch the clock; do what it does. Keep going.",
      "author": "Sam Levenson",
      "category": "Stress & Anxiety",
    },
    {
      "id": 3,
      "quote":
          "Success is not final, failure is not fatal: It is the courage to continue that counts.",
      "author": "Winston Churchill",
      "category": "Stress & Anxiety",
    },
    {
      "id": 4,
      "quote": "Believe you can and you're halfway there.",
      "author": "Theodore Roosevelt",
      "category": "Self-Confidence",
    },
    {
      "id": 5,
      "quote": "Your limitation—it's only your imagination.",
      "author": "Unknown",
      "category": "Self-Confidence",
    },
    {
      "id": 6,
      "quote": "Push yourself, because no one else is going to do it for you.",
      "author": "Unknown",
      "category": "Motivation",
    },
    {
      "id": 7,
      "quote": "Great things never come from comfort zones.",
      "author": "Unknown",
      "category": "Letting go",
    },
    {
      "id": 8,
      "quote": "Dream it. Wish it. Do it.",
      "author": "Unknown",
      "category": "Motivation",
    },
    {
      "id": 9,
      "quote": "Don't stop when you're tired. Stop when you're done.",
      "author": "Unknown",
      "category": "Motivation",
    },
    {
      "id": 10,
      "quote": "Wake up with determination. Go to bed with satisfaction.",
      "author": "Unknown",
      "category": "Motivation",
    },
    {
      "id": 11,
      "quote": "Do something today that your future self will thank you for.",
      "author": "Unknown",
      "category": "Self-Confidence",
    },
    {
      "id": 12,
      "quote": "Little things make big days.",
      "author": "Unknown",
      "category": "Happiness",
    },
    {
      "id": 13,
      "quote": "It's going to be hard, but hard does not mean impossible.",
      "author": "Unknown",
      "category": "Stress & Anxiety",
    },
    {
      "id": 14,
      "quote": "Don't wait for opportunity. Create it.",
      "author": "Unknown",
      "category": "Self-Confidence",
    },
    {
      "id": 15,
      "quote":
          "Sometimes we're tested not to show our weaknesses, but to discover our strengths.",
      "author": "Unknown",
      "category": "Letting go",
    },
  ];

  static List<Quote> getQuotesByPreferences(List<String> userPreferences) {
    if (userPreferences.isEmpty) {
      return quotesDummyList.map((data) => Quote.fromMap(data)).toList();
    }

    List<Map<String, dynamic>> filteredQuotes = quotesDummyList
        .where((quoteData) => userPreferences.contains(quoteData['category']))
        .toList();

    return filteredQuotes.map((data) => Quote.fromMap(data)).toList();
  }

  static Quote? getRandomQuote(List<String> userPreferences) {
    List<Quote> quotes = getQuotesByPreferences(userPreferences);
    if (quotes.isNotEmpty) {
      quotes.shuffle();
      return quotes.first;
    }
    return null;
  }
}
