import 'package:flutter/material.dart';

class TestingScreen extends StatelessWidget {
  const TestingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/gifs/background_image.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
