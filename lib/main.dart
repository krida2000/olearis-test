import 'package:flutter/material.dart';

import 'markup/view.dart';
import 'sign_in/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.signIn: (context) => const SignInView(),
        Routes.markup: (context) => const MarkupView(),
      },
      initialRoute: '/signIn',
    );
  }
}

class Routes {
  static const signIn = '/signIn';
  static const markup = '/markup';
}
