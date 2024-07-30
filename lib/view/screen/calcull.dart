import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hgp/controller/auth/calcull_controller.dart';
import 'package:hgp/controller/auth/calculll_controller.dart';
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

class Calcull extends StatelessWidget {
  const Calcull({super.key});

  @override
  Widget build(BuildContext context) {
          final CalcullController controller = Get.put(CalcullController(),permanent: true);


    String _selectedSystem = '';

    void _showAlertDialog(BuildContext context, String system) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Info'),
            content: Text('More information about $system.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Fermer'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
       body: Column(
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/logo-hgp.png",
                width: 100,
              ),
              SizedBox(width: 30),
              InkWell(
                onTap: () {
                 controller.goToCalcull();
                },
                child: Text(
                  "onBoardingtitre".tr,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(12.0),
            child: Text(
              " Nous offrons des systèmes muraux HGP FIRE, HGP ACOUSTIC et HGP CLIMA, alliant gypse et technologies modernes pour répondre aux besoins en résistance au feu, performances acoustiques, isolation thermique, résistance aux chocs et charges suspendues, assurant un choix optimal et économique pour les concepteurs.",
              textAlign: TextAlign.center, // Alignement centré du texte
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              child: Column(
                children: [
                  const Text("Veuillez choisir une seul système :"),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'HGP_ACOUSTIC',
                groupValue: _selectedSystem,
                onChanged: (value) {
                  /*   setState(() {
                    _selectedSystem = value!;
                  });*/
                },
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.primaryColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                padding: EdgeInsets.all(10.0), // Padding inside the border
                child: Column(
                  children: [
                    Image.asset(
                      AppImageAsset.hgpAcoustic,
                      width: 120,
                      height: 120,
                    ),
                    Text(
                      'le systém HGP ACOUSTIC',
                      style: TextStyle(
                        fontSize: 16.0, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => _showAlertDialog(context, 'HGP ACOUSTIC'),
                child: const Icon(Icons.info, size: 40),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'HGP_CLIMA',
                groupValue: _selectedSystem,
                onChanged: (value) {
                  /* setState(() {
                    _selectedSystem = value!;
                  });*/
                },
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.primaryColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 22.0), // Padding inside the border
                child: Column(
                  children: [
                    Image.asset(
                      AppImageAsset.hgpClima,
                      width: 120,
                      height: 120,
                    ),
                    const Text(
                      'le systém HGP CLIMA ',
                      style: TextStyle(
                        fontSize: 16.0, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => _showAlertDialog(context, 'HGP CLIMA'),
                child: const Icon(Icons.info, size: 40),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'HGP_FIRE',
                groupValue: _selectedSystem,
                onChanged: (value) {
                  /*  setState(() {
                    _selectedSystem = value!;
                  });*/
                },
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.primaryColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Image.asset(
                      AppImageAsset.hgpFire,
                      width: 120,
                      height: 120,
                    ),
                    const Text(
                      'le systém HGP FIRE ',
                      style: TextStyle(
                        fontSize: 16.0, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => _showAlertDialog(context, 'HGP FIRE'),
                child: const Icon(Icons.info, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
