import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:smart_hospital/presentation/views/auth/login_page.dart';
import 'package:smart_hospital/presentation/views/auth/signup_page.dart';
import 'package:smart_hospital/routes/app_routes.dart';


class AppPages {
  static var list = [
   

    GetPage(
      name: AppRoutes.SIGNIN,
      page: () =>LoginPage(),
      // binding:
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () =>SignupPage(),
      // binding:
    ),
    
  ];
}
