import 'package:hgp/controller/auth/forgetpassword_controller.dart';
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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    //7a9ne controller
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Forget Password",
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
              text: "Check Email",
            ),
            const SizedBox(height: 20),
            CustomTextBodyAuth(
                text:
                    "Please Enter Your Email Address To Recive A verification code    "),
            SizedBox(height: 10),
            SizedBox(height: 40),
            CustomTextFormAuth(
              isNumber: false,
              valid: (val) {
                return validInput(val!, 8, 30, "email");
              },
              //controller mawjode fel controller-->auth--->login.dart
              mycontroller: controller.email,
              hintText: "Enter your Email",
              iconData: Icons.email_outlined,
              labelText: "Email",
            ),
            CustomButtomAuth(
              text: "Vérifier",
              onPressed: () {
                controller.goToVerifyCode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
