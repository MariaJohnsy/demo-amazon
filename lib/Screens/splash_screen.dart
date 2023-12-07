import 'package:amazon_clone/Utils/data.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(amazonLogo,
            width: 200,
            height: 100,
            ),
            SizedBox(
              height: 16,
            ),
            CircularProgressIndicator(
              color: Colors.orange,
            ),
            Text("Loading.....",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            ),
          ],
        ),
      ),
    );
  }
}