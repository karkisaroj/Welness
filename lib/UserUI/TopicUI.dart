import 'package:flutter/material.dart';
import 'package:welness/AuthUI/login_screen.dart';
import 'package:welness/UserUI/HomeUI.dart';


class TopicUI extends StatefulWidget {
  const TopicUI({super.key});

  @override
  State<TopicUI> createState() => _TopicUIState();
}

class _TopicUIState extends State<TopicUI> {
  List<String> topics = [
    "Hard times", "Working out",
    "Productivity", "Self-esteem",
    "Achieving goals", "Inspiration",
    "Letting go", "Love",
    "Relationships", "Faith & Spirituality",
    "Positive thinking", "Stress & Anxiety"
  ];

  List<int> selected = [2,3,4];  // preselected indices

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp,),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>login_screen()));
          },
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text('Select all topics that \nmotivates you',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(child: topicButton(0)),
                SizedBox(width: 14),
                Expanded(child: topicButton(1)),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(child: topicButton(2)),
                SizedBox(width: 14),
                Expanded(child: topicButton(3)),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(child: topicButton(4)),
                SizedBox(width: 14),
                Expanded(child: topicButton(5)),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(child: topicButton(6)),
                SizedBox(width: 14),
                Expanded(child: topicButton(7)),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(child: topicButton(8)),
                SizedBox(width: 14),
                Expanded(child: topicButton(9)),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(child: topicButton(10)),
                SizedBox(width: 14),
                Expanded(child: topicButton(11)),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>HomeUI()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade800,
                  foregroundColor: Colors.white54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                child: Text("Save"),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget topicButton(int i) {
    bool isSelected = selected.contains(i);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selected.remove(i);
          } else {
            selected.add(i);
          }
        });
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white, width: 1),
        ),
        alignment: Alignment.center,
        child: Text(
          topics[i],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}