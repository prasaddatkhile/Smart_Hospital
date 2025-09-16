import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../model/auth/signup_model.dart';

class SignupController extends GetxController {
  // Form fields
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hospitalIdController = TextEditingController();

  // State
  var isPasswordVisible = false.obs;
  var selectedSpecialty = "".obs;

  // Specialty options
  final List<String> specialtyOptions = [
    "Doctor",
    "Nurse",
    "Wardboy",
    "Cardiologist",
    "Neurologist",
    "Gynologist",
    "Surgeon",
    "Pediatrician",
    "Lab Technician",
  ];

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void onSignup() {
    final user = SignupModel(
      fullName: fullNameController.text,
      email: emailController.text,
      password: passwordController.text,
      hospitalId: hospitalIdController.text,
      specialty: selectedSpecialty.value,
    );

    print("Signup Data => ${user.toJson()}");

    // Later integrate Firebase Auth + Firestore here
    // FirebaseAuth.instance.createUserWithEmailAndPassword(...)
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    hospitalIdController.dispose();
    super.onClose();
  }
}
