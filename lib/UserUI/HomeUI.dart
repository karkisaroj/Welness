import 'package:flutter/material.dart';
import 'package:welness/UserUI/MainUI.dart';
import 'package:welness/UserUI/UserProfile.dart';


class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text("Explore", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfile()),
                );
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white24,
                backgroundImage: AssetImage('lib/images/profile.png'),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white, width: 1.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border, color: Colors.white, size: 22),
                        SizedBox(width: 7),
                        Text("My favorites", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white, width: 1.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.notifications_none, color: Colors.white, size: 22),
                        SizedBox(width: 7),
                        Text("Remind Me", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 28),
            Text("Today's Quotes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19)),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainUI()),
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF232323),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: EdgeInsets.symmetric(vertical: 22, horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '"Your wellness is an investment, not an expense."',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      "- Author Name",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 28),
            Text("Quotes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 14),
            quoteButton(Icons.wb_sunny_outlined, "Feeling blessed"),
            SizedBox(height: 10),
            quoteButton(Icons.favorite_border, "Pride Month"),
            SizedBox(height: 10),
            quoteButton(Icons.star_border, "Self-worth"),
            SizedBox(height: 10),
            quoteButton(Icons.favorite, "Love"),
            SizedBox(height: 22),
            Text("Health Tips", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            quoteButton(Icons.wb_sunny_outlined, "Breathe to Reset"),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget quoteButton(IconData icon, String text) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Color(0xFF232323),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(width: 16),
          Icon(icon, color: Colors.white, size: 24),
          SizedBox(width: 18),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 18),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}