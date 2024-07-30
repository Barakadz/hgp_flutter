import 'package:hgp/controller/auth/verifycode_controller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/view/widget/auth/custombuttomauth.dart';
import 'package:hgp/view/widget/auth/customtextbodyauth.dart';
import 'package:hgp/view/widget/auth/customtextformauth.dart';
import 'package:hgp/view/widget/auth/customtexttitleauth.dart';
import 'package:hgp/view/widget/auth/loginauth.dart';
import 'package:hgp/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});
  @override
  Widget build(BuildContext context) {
    //7a9ne controller
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Verification Code",
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
              text: "Check code",
            ),
            const SizedBox(height: 20),
            CustomTextBodyAuth(text: "Please Enter The Digit Code Sent To "),
            SizedBox(height: 10),
            SizedBox(height: 40),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(10),
              numberOfFields: 5,
              borderColor: AppColor.primaryColor,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.goToResetPassword();
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
