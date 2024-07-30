import 'package:hgp/controller/auth/login_controller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/core/constant/routes.dart';
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

class AuthPlaquiste extends StatelessWidget {
  const AuthPlaquiste({super.key});
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
                
SizedBox(height: 150,),                
               
                 
                 
                 CustomButtomAuth(
                  text: "Je me connecte",
                  onPressed: () {
                   Get.offNamed(AppRoute.loginPlaquiste);

                  },
                ),
                SizedBox(height: 50,),
                CustomButtomAuth(
                  text: "Je m'inscris",
                  onPressed: () {
                   Get.offNamed(AppRoute.signupPlaquiste);
                  },
                ),
      
                 
                 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
