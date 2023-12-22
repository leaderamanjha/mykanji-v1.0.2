import 'package:mykanji/presentation/sign_up_one_screen/sign_up_one_screen.dart';
import 'package:mykanji/presentation/sign_up_one_screen/binding/sign_up_one_binding.dart';
import 'package:mykanji/presentation/splash_screen/splash_screen.dart';
import 'package:mykanji/presentation/splash_screen/binding/splash_binding.dart';
import 'package:mykanji/presentation/signupotp_screen/signupotp_screen.dart';
import 'package:mykanji/presentation/signupotp_screen/binding/signupotp_binding.dart';
import 'package:mykanji/presentation/logintwo_screen/logintwo_screen.dart';
import 'package:mykanji/presentation/logintwo_screen/binding/logintwo_binding.dart';
import 'package:mykanji/presentation/loginwithnumber_screen/loginwithnumber_screen.dart';
import 'package:mykanji/presentation/loginwithnumber_screen/binding/loginwithnumber_binding.dart';
import 'package:mykanji/presentation/loginotp_screen/loginotp_screen.dart';
import 'package:mykanji/presentation/loginotp_screen/binding/loginotp_binding.dart';
import 'package:mykanji/presentation/forgotpassword_screen/forgotpassword_screen.dart';
import 'package:mykanji/presentation/forgotpassword_screen/binding/forgotpassword_binding.dart';
import 'package:mykanji/presentation/forgetpasswordotp_screen/forgetpasswordotp_screen.dart';
import 'package:mykanji/presentation/forgetpasswordotp_screen/binding/forgetpasswordotp_binding.dart';
import 'package:mykanji/presentation/resetpassword_screen/resetpassword_screen.dart';
import 'package:mykanji/presentation/resetpassword_screen/binding/resetpassword_binding.dart';
import 'package:mykanji/presentation/home_screen/home_screen.dart';
import 'package:mykanji/presentation/home_screen/binding/home_binding.dart';
import 'package:mykanji/presentation/shopping_category_container_screen/shopping_category_container_screen.dart';
import 'package:mykanji/presentation/shopping_category_container_screen/binding/shopping_category_container_binding.dart';
import 'package:mykanji/presentation/list_product_screen/list_product_screen.dart';
import 'package:mykanji/presentation/list_product_screen/binding/list_product_binding.dart';
import 'package:mykanji/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:mykanji/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String signUpOneScreen = '/sign_up_one_screen';

  static const String splashScreen = '/splash_screen';

  static const String signupotpScreen = '/signupotp_screen';

  static const String logintwoScreen = '/logintwo_screen';

  static const String loginwithnumberScreen = '/loginwithnumber_screen';

  static const String loginotpScreen = '/loginotp_screen';

  static const String forgotpasswordScreen = '/forgotpassword_screen';

  static const String forgetpasswordotpScreen = '/forgetpasswordotp_screen';

  static const String resetpasswordScreen = '/resetpassword_screen';

  static const String homeScreen = '/home_screen';

  static const String shoppingCategoryPage = '/shopping_category_page';

  static const String shoppingCategoryTabContainerPage =
      '/shopping_category_tab_container_page';

  static const String shoppingCategoryContainerScreen =
      '/shopping_category_container_screen';

  static const String listProductScreen = '/list_product_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: signUpOneScreen,
      page: () => SignUpOneScreen(),
      bindings: [
        SignUpOneBinding(),
      ],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: signupotpScreen,
      page: () => SignupotpScreen(),
      bindings: [
        SignupotpBinding(),
      ],
    ),
    GetPage(
      name: logintwoScreen,
      page: () => LogintwoScreen(),
      bindings: [
        LogintwoBinding(),
      ],
    ),
    GetPage(
      name: loginwithnumberScreen,
      page: () => LoginwithnumberScreen(),
      bindings: [
        LoginwithnumberBinding(),
      ],
    ),
    GetPage(
      name: loginotpScreen,
      page: () => LoginotpScreen(),
      bindings: [
        LoginotpBinding(),
      ],
    ),
    GetPage(
      name: forgotpasswordScreen,
      page: () => ForgotpasswordScreen(),
      bindings: [
        ForgotpasswordBinding(),
      ],
    ),
    GetPage(
      name: forgetpasswordotpScreen,
      page: () => ForgetpasswordotpScreen(),
      bindings: [
        ForgetpasswordotpBinding(),
      ],
    ),
    GetPage(
      name: resetpasswordScreen,
      page: () => ResetpasswordScreen(),
      bindings: [
        ResetpasswordBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: shoppingCategoryContainerScreen,
      page: () => ShoppingCategoryContainerScreen(),
      bindings: [
        ShoppingCategoryContainerBinding(),
      ],
    ),
    GetPage(
      name: listProductScreen,
      page: () => ListProductScreen(),
      bindings: [
        ListProductBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SignUpOneScreen(),
      bindings: [
        SignUpOneBinding(),
      ],
    )
  ];
}
