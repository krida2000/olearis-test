import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  TextEditingController loginController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  RxBool isValid = RxBool(false);

  @override
  void onInit() {
    loginController.addListener(_listener);
    passwordController.addListener(_listener);

    super.onInit();
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _listener() {
    isValid.value =
        loginController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }
}
