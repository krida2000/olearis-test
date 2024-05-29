import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SignInController(),
      builder: (SignInController c) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              'Sign In',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            centerTitle: true,
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/olearis.png',
                    ),
                    TextField(
                      key: const Key('Login'),
                      controller: c.loginController,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        label: Text('Login'),
                      ),
                    ),
                    TextField(
                      key: const Key('Password'),
                      obscureText: true,
                      controller: c.passwordController,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        label: Text('Password'),
                      ),
                    ),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: OutlinedButton(
                          onPressed:
                              c.isValid.isTrue ? () => c.signIn(context) : null,
                          child: c.signingIn.isTrue
                              ? const Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Opacity(
                                      opacity: 0,
                                      child: Text('Continue'),
                                    ),
                                    SizedBox.square(
                                      dimension: 15,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  ],
                                )
                              : const Text('Continue'),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
