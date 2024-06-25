import 'package:brickmortar/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:brickmortar/features/user_auth/presentation/pages/login_page.dart';
import 'package:brickmortar/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:brickmortar/global/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       automaticallyImplyLeading: false,
  //       title: Text("SignUp"),
  //     ),
  //     body: Center(
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 15),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               "Sign Up",
  //               style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(
  //               height: 30,
  //             ),
  //             FormContainerWidget(
  //               controller: _usernameController,
  //               hintText: "Username",
  //               isPasswordField: false,
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             FormContainerWidget(
  //               controller: _emailController,
  //               hintText: "Email",
  //               isPasswordField: false,
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             FormContainerWidget(
  //               controller: _passwordController,
  //               hintText: "Password",
  //               isPasswordField: true,
  //             ),
  //             SizedBox(
  //               height: 30,
  //             ),
  //             GestureDetector(
  //               onTap:  (){
  //                 _signUp();

  //               },
  //               child: Container(
  //                 width: double.infinity,
  //                 height: 45,
  //                 decoration: BoxDecoration(
  //                   color: Colors.blue,
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 child: Center(
  //                     child: isSigningUp ? CircularProgressIndicator(color: Colors.white,):Text(
  //                   "Sign Up",
  //                   style: TextStyle(
  //                       color: Colors.white, fontWeight: FontWeight.bold),
  //                 )),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text("Already have an account?"),
  //                 SizedBox(
  //                   width: 5,
  //                 ),
  //                 GestureDetector(
  //                     onTap: () {
  //                       Navigator.pushAndRemoveUntil(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (context) => LoginPage()),
  //                           (route) => false);
  //                     },
  //                     child: Text(
  //                       "Login",
  //                       style: TextStyle(
  //                           color: Colors.blue, fontWeight: FontWeight.bold),
  //                     ))
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
                'Create account on\nBrick & Mortar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                  hintText: 'Username',
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
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
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
                controller: _passwordController,
                obscureText: true,
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
              SizedBox(height: 32),
              ElevatedButton(
                  onPressed: () {
                    _signUp();
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
                  'Sign up',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'LOG IN',
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

  void _signUp() async {

setState(() {
  isSigningUp = true;
});

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

setState(() {
  isSigningUp = false;
});
    if (user != null) {
      showToast(message: "User is successfully created");
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "Some error happend");
    }
  }
}
