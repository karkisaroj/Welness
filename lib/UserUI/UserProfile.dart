import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 28,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 14, bottom: 30),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFF232323),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage('lib/images/profile.png'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "john.doe@example.com",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Text(
              "MAKE IT YOURS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF232323),
                borderRadius: BorderRadius.circular(13),
              ),
              child: ListTile(
                leading: Icon(Icons.menu_book, size: 28, color: Colors.white),
                title: Text(
                  "Content preferences",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                onTap: () {},
              ),
            ),
            SizedBox(height: 26),
            Text(
              "ACCOUNT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF232323),
                borderRadius: BorderRadius.circular(13),
              ),
              child: ListTile(
                leading: Icon(Icons.edit, size: 28, color: Colors.white),
                title: Text(
                  "Theme",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                onTap: () {},
              ),
            ),
            SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF232323),
                borderRadius: BorderRadius.circular(13),
              ),
              child: ListTile(
                leading: Icon(Icons.password, size: 28, color: Colors.white),
                title: Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                onTap: () {},
              ),
            ),
            SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF232323),
                borderRadius: BorderRadius.circular(13),
              ),
              child: ListTile(
                leading: Icon(Icons.logout, size: 28, color: Colors.white),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}