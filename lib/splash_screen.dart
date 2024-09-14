import 'package:flutter/material.dart';
import 'login_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>LoginScreen()),
      );
    });
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 150),
          Padding(
            padding: EdgeInsets.only(left: 10), // Adjust left padding here
            child: Image.asset(
              'assets/images/splash.jpg',
              width: 300,
              height: 300,
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              "Health Care App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}