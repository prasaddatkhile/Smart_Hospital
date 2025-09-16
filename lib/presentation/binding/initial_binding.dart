import 'package:get/get.dart';
import 'package:smart_hospital/presentation/controller/auth/login_controller.dart';
import 'package:smart_hospital/presentation/controller/auth/signup_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<SignupController>(() => SignupController(), fenix: true);
  }
}
