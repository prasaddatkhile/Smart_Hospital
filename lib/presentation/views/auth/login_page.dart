import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../controller/auth/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());

  // Colors used (feel free to move these to a central constants file)
  final Color bgStart = const Color(0xFFF7F9FC);
  final Color bgEnd = const Color(0xFFFFFFFF);
  final List<Color> buttonGradient = const [
    Color(0xFF2B8DE6),
    Color(0xFF1E90FF)
  ];
  final Color inputFill = const Color(0xFFF6F7FA);
  final Color labelColor = const Color(0xFF222222);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;

    // Responsive sizing helpers
    double hp(double percent) => height * percent / 100;
    double wp(double percent) => width * percent / 100;
    double titleSize = wp(6.0); // top title
    double subtitleSize = wp(5); // small text
    double labelSize = wp(4.0);
    double inputTextSize = wp(4.2);
    double buttonTextSize = wp(4.6);

    return Scaffold(
      backgroundColor: bgEnd,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: mq.size.height - mq.padding.vertical),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: wp(6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: hp(12)),

                    // Logo + App name (Row)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: hp(2)),

                        // Logo image
                        Image.asset(
                          'assets/app_setting/app_logo.png',
                          width: wp(24),
                          height: wp(24),
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: wp(1)),
                        // App title (two-line style like image)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Smart Hospital',
                              style: TextStyle(
                                fontSize: titleSize,
                                fontWeight: FontWeight.w500,
                                color: labelColor,
                              ),
                            ),
                            Text(
                              'MediConnect',
                              style: TextStyle(
                                fontSize: subtitleSize,
                                fontWeight: FontWeight.w700,
                                color: labelColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: hp(10)),

                    // Email label
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: labelSize,
                        fontWeight: FontWeight.w600,
                        color: labelColor,
                      ),
                    ),
                    SizedBox(height: hp(1.5)),

                    // Email field
                    TextField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: inputTextSize),
                      decoration: InputDecoration(
                        hintText: 'Enter your Email',
                        hintStyle: TextStyle(fontSize: inputTextSize * 0.95),
                        filled: true,
                        fillColor: inputFill,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: hp(2.0), horizontal: wp(4)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),

                    SizedBox(height: hp(3)),

                    // Password label
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: labelSize,
                        fontWeight: FontWeight.w600,
                        color: labelColor,
                      ),
                    ),
                    SizedBox(height: hp(1.5)),

                    // Password field with eye button (reactive)
                    Obx(() {
                      return TextField(
                        controller: controller.passwordController,
                        obscureText: controller.obscurePassword.value,
                        style: TextStyle(fontSize: inputTextSize),
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(fontSize: inputTextSize * 0.95),
                          filled: true,
                          fillColor: inputFill,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: hp(2.0), horizontal: wp(4)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.obscurePassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey.shade600,
                            ),
                            onPressed: controller.togglePasswordVisibility,
                            splashRadius: 22,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      );
                    }),

                    // Forgot password text (right aligned)
                    SizedBox(height: hp(1.5)),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: controller.forgotPasswordPressed,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Forgot a password?',
                          style: TextStyle(
                            fontSize: labelSize * 0.95,
                            color: const Color(0xFF1E90FF),
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0xFF1E90FF),
                          ),
                        ),
                      ),
                    ),

                    // Spacer to push button toward bottom if space available
                    SizedBox(height: hp(8)),

                    // Login button (full width with gradient)
                    Obx(() {
                      return GestureDetector(
                        onTap: controller.isLoading.value
                            ? null
                            : controller.loginPressed,
                        child: Container(
                          width: double.infinity,
                          height: hp(7.2),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: buttonGradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: buttonGradient.last.withOpacity(0.28),
                                blurRadius: 16,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Center(
                            child: controller.isLoading.value
                                ? const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  )
                                : Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: buttonTextSize,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      height: hp(2),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 88),
                      child: Text(
                        "DON'T HAVE AN ACCOUNT?",
                        style: TextStyle(
                            fontSize: wp(3),
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: hp(1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 152),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.SIGNUP);
                        },
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              fontSize: wp(3),
                              color: Colors.teal,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.teal,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),

                    // Add a bottom spacer so the UI breathes on taller screens
                    SizedBox(height: hp(6)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
