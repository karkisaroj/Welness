import 'package:flutter/material.dart';
import 'package:welness/AuthUI/signup_screen.dart';
import 'package:welness/UserUI/TopicUI.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 350,
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIconColor: Colors.grey,
                  hintText: 'Enter your email',
                  prefixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 9),
                    child: Icon(Icons.email),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 350,
              child: TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Enter your password',
                  prefixIconColor: Colors.grey,
                  suffixIcon: Icon(Icons.visibility_off),
                  suffixIconColor: Colors.white54,
                  prefixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Icon(Icons.lock),
                  ),

                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350,
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        'Remember me',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 60,height: 19),
                      Text('Forgot Password?',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=>TopicUI())
              );
            },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade800,
                  fixedSize: Size(350, 55),
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
            ), child:Text('Login',style: TextStyle(color: Colors.white70))),
            SizedBox(height: 30),
            Text('Or',style: TextStyle(color: Colors.white,fontSize: 20)),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 55),
                  backgroundColor: Colors.grey.shade800,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('lib/images/google.png',height: 70,),
                    SizedBox(width:7),
                    Text('Google',style: TextStyle(color: Colors.white70)),
                  ],
                )),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
              },
              child: Text(
                "Don't have an account? Create a account",
                style: TextStyle(color: Colors.white),
              ),
            )
              ],
        ),
      ),
    );
  }
}