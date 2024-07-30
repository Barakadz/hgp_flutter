import 'package:hgp/core/constant/routes.dart';
import 'package:hgp/core/middelware/mymiddelware.dart';
import 'package:hgp/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:hgp/view/screen/auth/login.dart';
import 'package:hgp/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:hgp/view/screen/auth/signup.dart';
import 'package:hgp/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:hgp/view/screen/auth/success_signup.dart';
import 'package:hgp/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:hgp/view/screen/auth/verifycodesignup.dart';
import 'package:hgp/view/screen/auth_plaquiste.dart';
import 'package:hgp/view/screen/calcul.dart';
import 'package:hgp/view/screen/calcull.dart';
import 'package:hgp/view/screen/calculll.dart';
import 'package:hgp/view/screen/espace.dart';
import 'package:hgp/view/screen/homescreen.dart';
import 'package:hgp/view/screen/language.dart';
import 'package:hgp/view/screen/login_plaquiste.dart';
import 'package:hgp/view/screen/onboarding.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hgp/view/screen/register_plaquist.dart';
import 'package:hgp/view/screen/shemaFace.dart';

//Route of getx ya3mil delete lel memory automatiquement 3inda inti9al bayna pages
List<GetPage<dynamic>>? routes = [
  //main page start
  GetPage(name: "/", page: () => Language(), middlewares: [MyMiddleWare()]),
  //auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword, page: () => SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => SuccessSignUp()),
  //onBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.calculll, page: () => const Calculll()),
  GetPage(name: AppRoute.calcul, page: () => const Calcul()),

  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.accueil, page: () => const HomeScreen()),
  GetPage(name: AppRoute.home, page: () => const Espace()),
  GetPage(name: AppRoute.loginPlaquiste, page: () => const LoginPlaquiste()),
  GetPage(name: AppRoute.authPlaquiste, page: () => const AuthPlaquiste()),
  GetPage(name: AppRoute.signupPlaquiste, page: () => const SignUpPlaquiste()),

  GetPage(name: AppRoute.calcull, page: () => const Calcull()),
    GetPage(name: AppRoute.shema, page: () =>   ShemaCalcul()),

];
