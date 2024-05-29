import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/main.dart';
import 'controller.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SignInController(),
      builder: (SignInController c) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/olearis.png',
              ),
              TextField(
                key: const Key('Login'),
                controller: c.loginController,
                decoration: const InputDecoration(
                  hintText: 'Login',
                ),
              ),
              TextField(
                key: const Key('Password'),
                obscureText: true,
                controller: c.passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              Obx(() {
                return MaterialButton(
                  onPressed: c.isValid.isTrue
                      ? () {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.markup);
                        }
                      : null,
                  child: const Text('Continue'),
                );
              })
            ],
          ),
        );
      },
    );
  }
}
