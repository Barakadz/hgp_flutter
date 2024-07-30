import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hgp/controller/auth/calculll_controller.dart';
import 'package:hgp/controller/auth/shema_controller.dart';
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

class ShemaCalcul extends StatelessWidget {
  const  ShemaCalcul({super.key});



  @override
  Widget build(BuildContext context) {
        final ShemaControllerImp controller = Get.put(ShemaControllerImp(),permanent: true);

    String _selectedSystem = '';
    

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "HASNAOUI GYPSUM PANEL ",
            //jebeteha men theme data fel main
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey),
          )),
      body: Column(
        children: [ Container(
            margin: EdgeInsets.all(12.0),
            child: Text(
              "Veuillez choissir le shéma du chaque face",
              textAlign: TextAlign.center, // Alignement centré du texte
            ),
          ),
         Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Obx(() {
          return Column(
       children: [
Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              child: Column(
                children: [
                  const Text("Face 1:"),
                ],
              )),
            
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'FACE_SEC',
              groupValue: controller.selectedRadioFaceOne.value,
                   onChanged: (value) {
                    controller.setSelectedRadioFaceOne(value!);
                  },

              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.primaryColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                 child: Column(
                  children: [
                    Image.asset(
                      AppImageAsset.facesec,
                      width: 120,
                      height: 120,
                    ),
                   const Text(
                      'FACE SEC',
                      style: TextStyle(
                        fontSize: 14.0, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                      ),
                    ),
                  ],
                ),
              )
             
            ],
          ),
                    const SizedBox(height: 10),

            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'FACE_HUMIDE',
                  groupValue: controller.selectedRadioFaceOne.value,
                   onChanged: (value) {
                    controller.setSelectedRadioFaceOne(value!);
                  },

              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.primaryColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                  child: Column(
                  children: [
                    Image.asset(
                      AppImageAsset.facehumide,
                      width: 120,
                      height: 120,
                    ),
                    const Text(
                      'FACE HUMIDE',
                      style: TextStyle(
                        fontSize: 16.0, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                      ),
                    ),
                  ],
                ),
              ),
             
            ],
          ),
          const SizedBox(height: 10),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'Face_MIXTE',
                 groupValue: controller.selectedRadioFaceOne.value,
                   onChanged: (value) {
                    controller.setSelectedRadioFaceOne(value!);
                  },

              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.primaryColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                 child: Column(
                  children: [
                    Image.asset(
                      AppImageAsset.fecemixite,
                      width: 120,
                      height: 120,
                    ),
                    const Text(
                      'FACE MIXTE',
                      style: TextStyle(
                        fontSize: 16.0, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                      ),
                    ),
                  ],
                ),
              ),
            
            ],
          ),
          
          
          ],);
              }), 
              SizedBox(width:30),



 Obx(() {
          return Column(children: [
 Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              child: Column(
                children: [
                  const Text("Face 2:"),
                ],
              )),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'FACE_SEC',
                 groupValue: controller.selectedRadioFaceTwo.value,
                   onChanged: (value) {
                    controller.setSelectedRadioFaceTwo(value!);
                  },
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.primaryColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                 child: Column(
                  children: [
                    Image.asset(
                      AppImageAsset.facesec,
                      width: 120,
                      height: 120,
                    ),
                   const Text(
                      'FACE SEC',
                      style: TextStyle(
                        fontSize: 14.0, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                      ),
                    ),
                  ],
                ),
              )
             
            ],
          ),
                    const SizedBox(height: 10),

            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'FACE_HUMIDE',
                  groupValue: controller.selectedRadioFaceTwo.value,
                   onChanged: (value) {
                    controller.setSelectedRadioFaceTwo(value!);
                  },
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.primaryColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                  child: Column(
                  children: [
                    Image.asset(
                      AppImageAsset.facehumide,
                      width: 120,
                      height: 120,
                    ),
                    const Text(
                      'FACE HUMIDE',
                      style: TextStyle(
                        fontSize: 16.0, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                      ),
                    ),
                  ],
                ),
              ),
             
            ],
          ),
          const SizedBox(height: 10),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'Face_MIXTE',
                groupValue: controller.selectedRadioFaceTwo.value,
                   onChanged: (value) {
                    controller.setSelectedRadioFaceTwo(value!);
                  },
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.primaryColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                 child: Column(
                  children: [
                    Image.asset(
                      AppImageAsset.fecemixite,
                      width: 120,
                      height: 120,
                    ),
                    const Text(
                      'FACE MIXTE',
                      style: TextStyle(
                        fontSize: 16.0, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                      ),
                    ),
                  ],
                ),
              ),
            
            ],
          ),
          

          
          ],);
 })






         ],),
         SizedBox(height: 10,),
         CustomButtomAuth(
                          text: "Suivant",
                          onPressed: () {
                            controller.GoToCalcul();
                           },
                        ),    
        ],
      ),
    );
  }
}
