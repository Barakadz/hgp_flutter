import 'package:hgp/controller/auth/login_controller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/core/functions/alertexitapp.dart';
import 'package:hgp/core/functions/validinput.dart';
import 'package:hgp/view/widget/auth/custombuttomauth.dart';
import 'package:hgp/view/widget/auth/customtextbodyauth.dart';
import 'package:hgp/view/widget/auth/customtextformauth.dart';
import 'package:hgp/view/widget/auth/customtexttitleauth.dart';
import 'package:hgp/view/widget/auth/loginauth.dart';
import 'package:hgp/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    //7a9ne controller
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Sign in",
            //jebeteha men theme data fel main
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey),
          )),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                LogoAuth(),
                const CustomTextTitleAuth(
                  text: "Content de te revoir",
                ),
                const SizedBox(height: 20),
                CustomTextBodyAuth(
                    text:
                        "Connectez-vous avec votre e-mail et votre mot de passe Ou continuez avec les réseaux sociaux"),
                SizedBox(height: 10),
                SizedBox(height: 40),
                CustomTextFormAuth(
                  isNumber: false,
                  //controller mawjode fel controller-->auth--->login.dart
                  valid: (val) {
                    //premier paramettre yedi 9imate val
                    return validInput(val!, 5, 100, "email");
                  },
                  mycontroller: controller.email,
                  hintText: "Enter votre Email",
                  iconData: Icons.email,
                  labelText: "Email",
                ),
                CustomTextFormAuth(
                  obsucureText: true,
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 8, 30, "password");
                  },
                  mycontroller: controller.password,
                  hintText: "Enter votre Password",
                  iconData: Icons.lock,
                  labelText: "Password",
                ),
                InkWell(
                  onTap: () {
                    controller.goToForgetPassword();
                  },
                  child: Text(
                    "Forget Password",
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(height: 10),
                CustomButtomAuth(
                  text: "Connectez-vous",
                  onPressed: () {
                    controller.login();
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextSignUp(
                  textone: "Vous n’avez pas de compte ?",
                  texttwo: " S'incrire",
                  onTap: () {
                    controller.goToSignUp();
                  },
                ),
                InkWell(
                  onTap: () {
                    controller.goToCalcul();
                  },
                  child: Text(
                    "Calcul",
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
