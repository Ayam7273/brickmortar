import 'package:brickmortar/features/app/splash_screen/splash_screen.dart';
import 'package:brickmortar/features/user_auth/presentation/pages/login_page.dart';
import 'package:brickmortar/features/user_auth/presentation/pages/sign_out_page.dart';
import 'package:brickmortar/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:brickmortar/view/home/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; 


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyD8ReT_nVtzJQo4wlBfJJ5LNVboU6UGRoA", 
        appId: "1:78417678101:web:aeac648837eb5463d5e31c", 
        messagingSenderId: "78417678101", 
        projectId: "brickmortar-4ab79"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BrickMortar',
      routes: {
        '/': (context) => SplashScreen(
          child: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomeView(),
        '/signOut': (context) => SignOutPage(),

      },
    );
  }
}
