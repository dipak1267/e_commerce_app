import 'package:get/get.dart';
import 'package:portfolio_app/ui/screens/splash.dart';
import 'package:portfolio_app/ui/screens/start_up/intro/intro_screen.dart';
import 'package:portfolio_app/ui/screens/start_up/sign_in/sign_in_screen.dart';
import 'package:portfolio_app/ui/screens/start_up/sign_up/sign_up_screen.dart';

class RouteManager {
  static const String splashScreen = "/";
  static const String introScreen = "/intro_screen";
  static const String signInScreen = "/sign_in_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String homeScreen = "/home_screen";
  static const String productDetailScreen =
      "/home_screen/product_detail_screen";

  static List<GetPage> pages = [
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: introScreen, page: () => IntroScreen()),
  ];

  static navigate(String routeName) {
    Get.toNamed(routeName);
  }

  /// For clear previous routes
  static navigateOff(String routeName) {
    Get.offAllNamed(routeName);
  }
}
