import 'package:flutter/material.dart';

class QuotePage extends StatelessWidget {
  final List<String> selectedTopics;

  const QuotePage({super.key, required this.selectedTopics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Selected Topics")),
      body: ListView.builder(
        itemCount: selectedTopics.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final topic = selectedTopics[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text(topic, style: TextStyle(fontSize: 16)),
            ),
          );
        },
      ),
    );
  }
}
