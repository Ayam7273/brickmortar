import 'package:brickmortar/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:brickmortar/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:brickmortar/global/common/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../firebase_auth_implementation/firebase_auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                  'Login to continue on\nBrick & Mortar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 32),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail, color: Colors.grey),
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    _signIn();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF0066FF),
                    padding: EdgeInsets.symmetric(horizontal: 86, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Log in',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'OR',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                   _signInWithGoogle();
                  },
                  icon: Image.asset('assets/img/google.png', height: 24, width: 24), 
                  label: Text(
                    'Continue with Google',
                    style: TextStyle(color: Color(0xFF0066FF)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
    );
  }




  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "some error occured");
    }
  }


  _signInWithGoogle()async{

    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {

      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if(googleSignInAccount != null ){
        final GoogleSignInAuthentication googleSignInAuthentication = await
        googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushNamed(context, "/home");
      }

    }catch(e) {
showToast(message: "some error occured $e");
    }


  }


}