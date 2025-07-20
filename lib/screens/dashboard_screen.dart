import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://example.com/profile.jpg'),
          ),
        ],
      ),
    );
  }
}
