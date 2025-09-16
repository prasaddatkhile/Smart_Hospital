import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Reactive state
  final obscurePassword = true.obs;
  final isLoading = false.obs;

  /// Toggle password visibility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  /// Called when user taps "Forgot a password?"
  void forgotPasswordPressed() {
    // TODO: implement forgot password flow
    // e.g. navigate to ForgotPasswordPage or show a dialog
  }

  /// Called when user taps "Log In"
  void loginPressed() async {
    // TODO: implement login logic
    // Example structure:
    // isLoading.value = true;
    // try { await authService.login(...) } finally { isLoading.value = false; }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
