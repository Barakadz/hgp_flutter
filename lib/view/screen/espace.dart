import 'package:hgp/controller/auth/calculll_controller.dart';
import 'package:hgp/controller/auth/espace_controller.dart';
import 'package:hgp/controller/auth/signup_controller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/core/constant/imageasset.dart';
import 'package:hgp/core/constant/routes.dart';
import 'package:hgp/core/functions/alertexitapp.dart';
import 'package:hgp/core/functions/validinput.dart';
import 'package:hgp/core/services/services.dart';
import 'package:hgp/view/widget/auth/custombuttomauth.dart';
import 'package:hgp/view/widget/auth/customtextbodyauth.dart';
import 'package:hgp/view/widget/auth/customtextformauth.dart';
import 'package:hgp/view/widget/auth/customtexttitleauth.dart';
import 'package:hgp/view/widget/auth/loginauth.dart';
import 'package:hgp/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hgp/view/widget/setting.dart';

class Espace extends StatelessWidget {
  const Espace({super.key});

  @override
  Widget build(BuildContext context) {
    //7a9ne controller
    final CalculControllerImp controller = Get.put(CalculControllerImp());

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Image de fond
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImageAsset.espace),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenu de l'écran
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Center(
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Container(
                  width: Get.width - 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                            0.5), // Couleur de l'ombre avec opacité
                        spreadRadius: 5, // Rayon de diffusion de l'ombre
                        blurRadius: 10, // Rayon de flou de l'ombre
                        offset: Offset(0, 5), // Décalage de l'ombre (x, y)
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Center(
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(AppImageAsset
                                .logo), // Make sure the path is correct
                            width: 120,
                          ),
                          SizedBox(height: 1),
                          Text(
                            'Bienvenue',
                            style: TextStyle(
                                color: AppColor.primaryColor, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'connectez-vous à l’Espace Abonné de votre choix :',
                            style:
                                TextStyle(color: AppColor.greyy, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColor.primaryColor,
                                  width: 1.0,
                                ),
                              ),
                              child: customListTile(
                                icon: Icons.arrow_circle_right,
                                text: "Espace Professionnelle",
                                onTap: () {
                                  controller.goToPlaquiste();
                                },
                                leadingIcon:
                                    Icons.supervised_user_circle_rounded,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColor.primaryColor,
                                  width: 1.0,
                                ),
                              ),
                              child: customListTile(
                                icon: Icons.arrow_circle_right,
                                text: "Espace Particulier",
                                onTap: () {
                                  controller.goToClient();
                                },
                                leadingIcon: Icons.supervised_user_circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
