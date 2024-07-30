import 'package:hgp/controller/auth/signup_controller.dart';
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

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    //7a9ne controller
    final SignUpControllerImp controller = Get.put(SignUpControllerImp());

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "inscrire".tr,
            //jebeteha men theme data fel main
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey),
          )),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => controller.isLoading.value == true
            ? Center(
                child: Image.asset(
                "assets/images/lodingg.gif",
              ))
            : WillPopScope(
                onWillPop: alertExitApp,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        SizedBox(height: 4),
                        Row(children: [
                          Expanded(
                            child: CustomTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                //premier parametre yedi val
                                return validInput(val!, 5, 50, "nom");
                              },
                              mycontroller: controller.nom,
                              hintText: "nom".tr,
                              iconData: Icons.person_2_outlined,
                              labelText: "Nom",
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CustomTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 100, "prenom");
                              },
                              mycontroller: controller.prenom,
                              hintText: "prenom".tr,
                              iconData: Icons.person_2_outlined,
                              labelText: "Prénom",
                            ),
                          )
                        ]),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 100, "adresse");
                          },
                          mycontroller: controller.adresse,
                          hintText: "adresse".tr,
                          iconData: Icons.location_on_outlined,
                          labelText: "adresse",
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 100, "nom_entreprise");
                          },
                          mycontroller: controller.nom_dentreprise,
                          hintText: "nom_entreprise".tr,
                          iconData: Icons.location_city_outlined,
                          labelText: "nom_entreprise",
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          mycontroller: controller.email,
                          hintText: "mail".tr,
                          iconData: Icons.email_outlined,
                          labelText: "Email",
                        ),
                        CustomTextFormAuth(
                          isNumber: true,
                          valid: (val) {
                            return validInput(val!, 10, 10, "telephone");
                          },
                          mycontroller: controller.telephone,
                          hintText: "telephone".tr,
                          iconData: Icons.call_outlined,
                          labelText: "téléphone",
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 10, 10, "password");
                          },
                          obsucureText: true,
                          mycontroller: controller.password,
                          hintText: "password".tr,
                          iconData: Icons.lock_outlined,
                          labelText: "Password",
                        ),
                        SizedBox(height: 10),
                        CustomButtomAuth(
                          text: "connectez-vous".tr,
                          onPressed: () {
                            controller.signUp();
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextSignUp(
                                textone: "textone".tr,
                                texttwo: "texttwo".tr,
                                onTap: () {
                                  controller.goToSignIn();
                                },
                              )
                            ])
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
