import 'package:hgp/controller/auth/successsignup_controller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/view/widget/auth/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  SuccessSignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            Text(""),
            Container(
              width: double.infinity,
              child: CustomButtomAuth(
                  text: "Go to Login",
                  onPressed: () {
                    controller.goToPageLogin();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
