import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/signup_controller.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.07,
                      vertical: size.height * 0.03,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ---------- Logo & Title ----------
                        Center(
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/app_setting/app_logo.png",
                                height: size.height * 0.12,
                              ),
                              //SizedBox(height: size.height * 0.025),
                              Text(
                                "Create an Account",
                                style: TextStyle(
                                  fontSize: size.width * 0.055,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              SizedBox(height: 24),
                              Image.asset(
                                "assets/images/healthLine_image.png",
                                height: size.height * 0.075,
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: size.height * 0.04),
                        // SizedBox(height: 10),

                        SizedBox(height: 10),
                        // ---------- Full Name ----------
                        TextField(
                          controller: controller.fullNameController,
                          decoration: const InputDecoration(
                            labelText: "Full Name",
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),

                        // ---------- Email ----------
                        TextField(
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: "Email Address",
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),

                        // ---------- Password ----------
                        Obx(() => TextField(
                              controller: controller.passwordController,
                              obscureText: !controller.isPasswordVisible.value,
                              decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: const Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isPasswordVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed:
                                      controller.togglePasswordVisibility,
                                ),
                                border: const OutlineInputBorder(),
                              ),
                            )),
                        SizedBox(height: size.height * 0.02),

                        // ---------- Specialty Dropdown ----------
                        const Text(
                          "Specialty",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Obx(() => DropdownButtonFormField<String>(
                              value: controller.selectedSpecialty.value.isEmpty
                                  ? null
                                  : controller.selectedSpecialty.value,
                              items: controller.specialtyOptions
                                  .map((role) => DropdownMenuItem(
                                      value: role, child: Text(role)))
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  controller.selectedSpecialty.value = value;
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.local_hospital_outlined),
                              ),
                            )),
                        SizedBox(height: size.height * 0.02),

                        // ---------- Hospital ID ----------
                        // TextField(
                        //   controller: controller.hospitalIdController,
                        //   decoration: const InputDecoration(
                        //     labelText: "Hospital ID",
                        //     prefixIcon: Icon(Icons.badge_outlined),
                        //     border: OutlineInputBorder(),
                        //   ),
                        // ),
                        SizedBox(height: size.height * 0.04),

                        // ---------- Sign Up Button ----------
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: controller.onSignup,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.018,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.teal,
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: size.width * 0.045,
                                color: Colors.white,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // ---------- Already have account ----------
                        // Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account? ",
                              style: TextStyle(fontFamily: "Poppins"),
                            ),
                            InkWell(
                                onTap: () {
                                  Get.back(); // Navigate to Login
                                },
                                child: const Text(
                                  "Log In",
                                  style: TextStyle(
                                    color: const Color(0xFF1E90FF),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins",
                                    decoration: TextDecoration.underline,
                                    decorationColor: const Color(0xFF1E90FF),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
