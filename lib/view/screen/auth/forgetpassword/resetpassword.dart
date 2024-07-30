import 'package:hgp/controller/auth/forgetpassword_controller.dart';
import 'package:hgp/controller/auth/resetpassword_controller.dart';
import 'package:hgp/controller/auth/signup_controller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/core/functions/validinput.dart';
import 'package:hgp/view/widget/auth/custombuttomauth.dart';
import 'package:hgp/view/widget/auth/customtextbodyauth.dart';
import 'package:hgp/view/widget/auth/customtextformauth.dart';
import 'package:hgp/view/widget/auth/customtexttitleauth.dart';
import 'package:hgp/view/widget/auth/loginauth.dart';
import 'package:hgp/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    //7a9ne controller
    RessetPasswordControllerImp controller =
        Get.put(RessetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Reset Password",
            //jebeteha men theme data fel main
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey),
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            LogoAuth(),
            const CustomTextTitleAuth(
              text: "New Password",
            ),
            const SizedBox(height: 20),
            CustomTextBodyAuth(text: "please Enter new Password "),
            SizedBox(height: 10),
            SizedBox(height: 40),
            CustomTextFormAuth(
              isNumber: false,
              valid: (val) {
                return validInput(val!, 8, 30, "password");
              },
              mycontroller: controller.password,
              hintText: "Enter votre Password *",
              iconData: Icons.lock_outline,
              labelText: "téléphone",
            ),
            CustomTextFormAuth(
              isNumber: false,
              valid: (val) {
                return validInput(val!, 8, 30, "password");
              },
              mycontroller: controller.repassword,
              hintText: "Confirmer votre Password *",
              iconData: Icons.lock_outline,
              labelText: "téléphone",
            ),
            CustomButtomAuth(
              text: "save",
              onPressed: () {
                controller.goToSuccessResetPassword();
              },
            ),
          ],
        ),
      ),
    );
  }
}
