import 'package:flutter/material.dart';
import '../../user_auth/presentation/pages/login_page.dart';


class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),(){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget.child!), (route) => false);
    }
    );
    super.initState();
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
              Image.asset(
                'assets/img/logo.png', 
                height: 150,
              ),
              SizedBox(height: 32),
              Text(
                'Brick & Mortar',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Download and read the best here!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF0066FF),
                  padding: EdgeInsets.symmetric(horizontal: 86, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Let's go",
                      style: TextStyle(fontSize: 16),
                      
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
