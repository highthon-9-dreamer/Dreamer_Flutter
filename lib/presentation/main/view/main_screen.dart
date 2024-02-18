import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 56,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Text(
                '꿈방',
                style: TextStyle(
                  color: DreamerColor.white,
                  fontFamily: suit,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Image.asset('assets/images/icons/main/main_library.png'),
          ],
        ),
      ),
    );
  }
}
