import 'package:flutter/material.dart';
import 'package:welness/AuthUI/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 120,),
          Text('Welcome to wellness \njourney today.',style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35,
            height: 1.5
          ),),
          SizedBox(height: 40),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              hintText: 'Enter your name',
                hintStyle: TextStyle(color: Colors.white54,
                fontSize: 20,
                fontWeight: FontWeight.normal
                ),
                prefixIcon: Icon(Icons.person),
              prefixIconColor: Colors.white54
            ),
          ),
          SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              hintText: "Enter your email",
              hintStyle: TextStyle(
                color: Colors.white54,
                fontSize: 20,
                fontWeight: FontWeight.normal
              ),
              prefixIcon: Icon(Icons.mail),
              prefixIconColor: Colors.white54,
            ),
          ),
          SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              hintText: "Enter your password",
              hintStyle: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.normal,
                fontSize: 20
              ),
              prefixIcon: Icon(Icons.lock),
              prefixIconColor: Colors.white54,
              suffixIcon: Icon(Icons.visibility_off),
              suffixIconColor: Colors.white60
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Checkbox(value: isChecked, onChanged: (bool?value){
                      setState(() {
                        isChecked=value??false;
                      });
                    })
                  ],
                ),
              ),
              Text('Remember me',style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400
              ),)
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            fixedSize: Size(360, 50),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15
            )
          ),
              child:Text("Sign up"),),
          SizedBox(height: 20),
          Center(
            child: Text("or",
              style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  height: 1,
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            fixedSize: Size(360, 50),
            backgroundColor: Colors.grey.shade800,
            foregroundColor: Colors.white54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            )
          ), child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/images/google.png',height: 30,width: 45,),
              Text("Google"),
            ],
          ),),
          SizedBox(height: 30),
          Center(
            child: GestureDetector(onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>login_screen())
              );
            }, child: Text("Already have a account? Login",style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500
            ),),
          )
          )
        ],
      ),
    ),
    );
  }
}
