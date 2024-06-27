import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'markup/view.dart';
import 'sign_in/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: Routes.signIn,
      routes: [
        GoRoute(
          path: Routes.signIn,
          builder: (context, state) => const SignInView(),
        ),
        GoRoute(
          path: Routes.markup,
          builder: (context, state) => const MarkupView(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blue,
          disabledColor: Colors.grey,
          textTheme: ButtonTextTheme.primary,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.black12;
              }

              return Colors.blue;
            }),
            foregroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.black26;
              }

              return Colors.white;
            }),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            side: WidgetStateProperty.all(BorderSide.none),
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

class Routes {
  static const signIn = '/signIn';
  static const markup = '/markup';
}
