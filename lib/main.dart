import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hospital/presentation/controller/general/loading_controller.dart';

import 'presentation/binding/initial_binding.dart';
import 'presentation/widgets/common/loading_page.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'utils/constant/constants.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
//         ),
//       ),
//     );
//   }
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // FirebaseAppCheck.instance.activate(
  //   webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  //   androidProvider: AndroidProvider.playIntegrity,
  // );
  //final String defaultLanguage = await loadDefaultLanguage(); // Load language
  runApp(MyApp(defaultLanguage: "en"));
  //runApp(const MyApp());
}

// Future<String> loadDefaultLanguage() async {
//   try {
//     final String jsonString =
//         await rootBundle.loadString('assets/app_setting/app_services.json');
//     final Map<String, dynamic> data = jsonDecode(jsonString);
//     return data['app_info']['default_language'] ??
//         'en'; // Fallback to 'en' if null
//   } catch (e) {
//     print("Error loading JSON: $e");
//     return 'en'; // Fallback language
//   }
// }

class MyApp extends StatefulWidget {
  final String defaultLanguage;
  const MyApp({super.key, required this.defaultLanguage});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _loader = Get.put(LoadingController());

  @override
  void initState() {
    super.initState();
    print("initState");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    print("dispose");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.SIGNIN,
      getPages: AppPages.list,
      themeMode: ThemeMode.system,
      builder: (context, child) {
        return Stack(
          children: [
            Obx(() {
              return Opacity(
                opacity: (_loader.isLoading.value == true) ? .5 : 1,
                child: child!,
              );
            }),
            LoadingScreen(),
          ],
        );
      },
      theme: ThemeData(
        fontFamily: "Poppins",
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
        ),
      ),
    );
  }
}

