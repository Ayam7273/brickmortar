
import 'package:brickmortar/global/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutPage extends StatefulWidget{
  const SignOutPage({super.key});

  @override
  State<SignOutPage> createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOutPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0066FF),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  'Goodbye👋👋\nCatch you later!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              SizedBox(height: 50),

              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, "/login");
                  showToast(message: "Successfully signed out");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      "Sign out",
                      style: TextStyle(
                          color: Color(0xFF0066FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                          
                    ),
                  ),
                ),
              ),

              SizedBox(height: 100),
              

            ],
          ),
        )
      )
    );
  }
}