import 'package:dreamer_flutter/presentation/auth/view/sign_in_screen.dart';
import 'package:dreamer_flutter/presentation/auth/view/sign_up_screen.dart';
import 'package:dreamer_flutter/presentation/page_manager/view/page_manager_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Suit',
      ),
      home: const SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
