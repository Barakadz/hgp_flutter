import 'package:flutter/widgets.dart';
import 'package:hgp/controller/auth/calcul_controller.dart';
import 'package:hgp/controller/auth/signup_controller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/core/functions/alertexitapp.dart';
import 'package:hgp/core/functions/validinput.dart';
import 'package:hgp/view/screen/dropdown_accrochage.dart';
import 'package:hgp/view/screen/dropdown_getx.dart';
import 'package:hgp/view/screen/dropdown_menu.dart';
import 'package:hgp/view/screen/dropdown_menuu.dart';
import 'package:hgp/view/widget/auth/custombuttomauth.dart';
import 'package:hgp/view/widget/auth/customtextbodyauth.dart';
import 'package:hgp/view/widget/auth/customtextformauth.dart';
import 'package:hgp/view/widget/auth/customtexttitleauth.dart';
import 'package:hgp/view/widget/auth/loginauth.dart';
import 'package:hgp/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyController extends GetxController {
  var selectedValue = 'Cloison'.obs;
}

class MyControllery extends GetxController {
  var isChecked = false.obs;
  var showTextFields = false.obs;

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
    showTextFields.value = isChecked.value;
  }
}




class MyControlleryy extends GetxController {
  var isChecked = false.obs;
  var showTextFields = false.obs;

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
    showTextFields.value = isChecked.value;
  }
}

class MyControlleryyy extends GetxController {
  var isChecked = false.obs;
  var showTextFields = false.obs;

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
    showTextFields.value = isChecked.value;
  }
}

class Calcul extends StatelessWidget {
  const Calcul({super.key});
  @override
  Widget build(BuildContext context) {
    //7a9ne controller
    final CalculControllerImp controller = Get.put(CalculControllerImp(),permanent: true);
     
    final DropDownAccrochage controllerAccrochageObjet =
        Get.put(DropDownAccrochage());

 

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(244, 248, 255, 1),
        elevation: 0.0,
        title: Text(
          "HASNAOUI GYPSUM PANEL",
          //jebeteha men theme data fel main
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.restart_alt, size: 25),
            onPressed: () {
              // Action when the icon is pressed
              print('Info icon pressed');
            },
          ),
        ],
      ),
      body: GetBuilder<CalculControllerImp>(
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
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Choissir le type de la cloison : ",
                                style: TextStyle(
                                    color: Colors.black), // Default text color
                              ),
                              TextSpan(
                                text: "*",
                                style: TextStyle(
                                    color: Colors
                                        .red), // Red color for the asterisk
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: AppColor.primaryColor)),
                                child: Obx(() => DropdownButton<String>(
                                      borderRadius: BorderRadius.circular(2),
                                      padding: EdgeInsets.all(5),
                                      isExpanded: true,
                                      underline: SizedBox(),
                                      value:
                                          controller.selectedValueTypeCloison.value,
                                      items: <String>[
                                        'cloison (double parments)',
                                        'contre cloison (simple parments)',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Row(children: [
                                            Icon(
                                              FontAwesomeIcons.square,
                                            ), // Add your icon here
                                            SizedBox(
                                                width: 8), // Add some spacing
                                            Text(value),
                                          ]),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          controller
                                              .setSelectedValueTypeCloison(newValue);
                                          controller.selectedOption.value =
                                              newValue!;
                                        }
                                      },
                                    )),
                              ),
                            ]),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 80,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 17.0), // Set the top margin here

                                child: CustomTextFormAuth(
                                  isNumber: true,
                                  valid: (val) {
                                    // Validate the input for the first field
                                    return validInput(val!, 5, 50, "largeur");
                                  },
                                  mycontroller: controller.largeur,
                                  hintText: "largeur_calcul".tr,
                                  iconData: FontAwesomeIcons.arrowsAltH,
                                  labelText: "largeur",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 20,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: AppColor.primaryColor)),
                                child: Obx(() => DropdownButton<String>(
                                      borderRadius: BorderRadius.circular(2),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      isExpanded: true,
                                      underline: SizedBox(),
                                      value: controller.uniteLargeurCloisson.value,
                                      items: <String>[
                                        'm',
                                        'cm',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Row(children: [
                                            // Add your icon here
                                            SizedBox(
                                                width: 2), // Add some spacing
                                            Text(value),
                                          ]),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          controller
                                              .setSelectedUniteLargeurCloisson(newValue);
                                          controller.uniteLargeurCloisson.value =
                                              newValue!;
                                        }
                                      },
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 80,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 17.0), // Set the top margin here

                                child: CustomTextFormAuth(
                                  isNumber: true,
                                  valid: (val) {
                                    return validInput(val!, 5, 100, "hauteur");
                                  },
                                  mycontroller: controller.hauteur,
                                  hintText: "hauteur_calcul".tr,
                                  iconData: FontAwesomeIcons.arrowsAltV,
                                  labelText: "hauteur",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 20,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: AppColor.primaryColor)),
                                child: Obx(() => DropdownButton<String>(
                                      borderRadius: BorderRadius.circular(2),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      isExpanded: true,
                                      underline: SizedBox(),
                                      value:
                                          controller.uniteHauteurCloisson.value,
                                      items: <String>[
                                        'm',
                                        'cm',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Row(children: [
                                            // Add your icon here
                                            SizedBox(
                                                width: 2), // Add some spacing
                                            Text(value),
                                          ]),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          controller
                                              .setSelectedUniteHauteurCloisson(newValue);
                                          controller.uniteHauteurCloisson.value =
                                              newValue!;
                                        }
                                      },
                                    )),
                              ),
                            ),
                          ],
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Ouvertures : ",
                                style: TextStyle(
                                    color: Colors.black), // Default text color
                              ),
                              TextSpan(
                                text: "*",
                                style: TextStyle(
                                    color: Colors
                                        .red), // Red color for the asterisk
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border:
                                      Border.all(color: AppColor.primaryColor)),
                              child: Obx(() => DropdownButton<String>(
                                    borderRadius: BorderRadius.circular(2),
                                    padding: EdgeInsets.all(5),
                                    isExpanded: true,
                                    underline: SizedBox(),
                                    value: controller.selectedTypeMur.value,
                                    items: <String>[
                                      'mur plein',
                                      'mur avec porte',
                                      'mur avec fenetre',
                                      'mur avec porte et fenetre'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Row(children: [
                                          const Icon(
                                            FontAwesomeIcons.square,
                                          ), // Add your icon here
                                          SizedBox(
                                              width: 8), // Add some spacing
                                          Text(value),
                                        ]),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        controller.setSelectedTypeMur(newValue);
                                        controller.selectedOption.value =
                                            newValue!;
                                      }
                                    },
                                  )),
                            ),
                            SizedBox(height: 20),
                            /*Obx(() => Text(
                                'Selected value: ${controllerr.selectedValue.value}')),*/
                          ],
                        ),
                        Obx(() => controller.selectedTypeMur == "mur avec porte"
                            ? Column(children: [
                                 RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Le nombre du porte: ",
                                style: TextStyle(
                                    color: Colors.black), // Default text color
                              ),
                              TextSpan(
                                text: "*",
                                style: TextStyle(
                                    color: Colors
                                        .red), // Red color for the asterisk
                              ),
                            ],
                          ),
                        ),
                                CustomTextFormAuth(
                                  isNumber: true,
                                  valid: (val) {
                                    return validInput(
                                        val!, 5, 30 , "nombre_porte");
                                  },
                                  mycontroller: controller.nombre_porte,
                                  hintText: "Le nombre du porte *",
                                  iconData: null,
                                  labelText: "nombre du porte",
                                ),
                               const Text("Est-ce que c'est similaire ?", style: TextStyle(
              fontSize: 24),),
             
       Row(
          children: <Widget>[
            Expanded(
              child: RadioListTile<String>(
                activeColor: Colors.blue,
                title: Text('Non'),
                value: 'Non',
                groupValue: controller.selectedSimilaire.value,
                onChanged: (String? value) {
                  controller.selectedSimilaire.value = value!;
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                activeColor: Colors.blue,
                title: Text('Oui'),
                value: 'Oui',
                groupValue: controller.selectedSimilaire.value,
                onChanged: (String? value) {
                  controller.selectedSimilaire.value = value!;
                },
              ),
            ),
          ],
        ),

               Obx(() {
  if (controller.selectedSimilaire.value == 'Oui') {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 80,
              child: Container(
                margin: EdgeInsets.only(top: 17.0),
                child: CustomTextFormAuth(
                  isNumber: true,
                  valid: (val) {
                    return validInput(val!, 5, 50, "largeur");
                  },
                  mycontroller: controller.largeur_porte_similaire,
                  hintText: "largeur du chaque porte",
                  iconData: FontAwesomeIcons.arrowsAltH,
                  labelText: "largeur",
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: AppColor.primaryColor),
                ),
                child: Obx(() => DropdownButton<String>(
                      borderRadius: BorderRadius.circular(2),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      isExpanded: true,
                      underline: SizedBox(),
                      value: controller.uniteLargeurSimailairePorte.value,
                      items: <String>['m', 'cm'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              SizedBox(width: 2),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.setSelectedUniteLargeurSimailairePorte(newValue);
                          controller.uniteLargeurSimailairePorte.value = newValue;
                        }
                      },
                    )),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 80,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: CustomTextFormAuth(
                  isNumber: true,
                  valid: (val) {
                    return validInput(val!, 5, 50, "hauteur");
                  },
                  mycontroller: controller.hauteur_porte_similaire,
                  hintText: "Hauteur du chaque porte",
                  iconData: FontAwesomeIcons.arrowsAltV,
                  labelText: "hauteur",
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: AppColor.primaryColor),
                ),
                child: Obx(() => DropdownButton<String>(
                      borderRadius: BorderRadius.circular(2),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      isExpanded: true,
                      underline: SizedBox(),
                      value: controller.uniteHauteurSimailairePorte.value,
                      items: <String>['m', 'cm'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              SizedBox(width: 2),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.setSelectedUniteHauteurPorte(newValue);
                          controller.uniteHauteurSimailairePorte.value = newValue;
                        }
                      },
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  } else if (controller.selectedSimilaire.value == 'Non') {
    return Column(
  children: [
       
  ...List.generate(int.parse(controller.nombre_porte.text) , (index) {
      return Column(
        children: [
      Row(
  children: [
    Expanded(
      flex: 1,
      child: CustomTextFormAuth(
        isNumber: true,
        valid: (val) {
          return validInput(val!, 5, 100, "hauteur_v");
        },
                            //  mycontroller: controller.hauteurControllers[index],
mycontroller: controller.hauteur,

         hintText: "hauteur_calcul".tr,
        iconData: FontAwesomeIcons.arrowsAltV,
        labelText: "hauteur_vertical",
      ),
    ),
    SizedBox(width: 16), // Adds spacing between the fields
    Expanded(
      flex: 1,
      child: CustomTextFormAuth(
        isNumber: true,
        valid: (val) {
          return validInput(val!, 5, 100, "hauteur_h£$index");
        },
   //  mycontroller: controller.largeurControllers[index],
mycontroller: controller.hauteur,
        hintText: "hauteur_calcul".tr,
        iconData: FontAwesomeIcons.arrowsAltH,
        labelText: "hauteur_horizontal",
      ),
    ),
  ],
)


        ],
      );
    }),   
  ],
);

  }

    // Default return value to ensure a Widget is always returned
  return SizedBox(); // Return an empty widget or some other default widget
})
,

             

                                /* Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextFormAuth(
                                        sufixtext: "m".tr,
                                        isNumber: true,
                                        valid: (val) {
                                          return validInput(
                                              val!, 5, 100, "largeur_porte");
                                        },
                                        mycontroller: controller.largeur_porte,
                                        hintText: "Largeur du porte *",
                                        iconData: FontAwesomeIcons.arrowsAltH,
                                        labelText: "largeur_porte",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: CustomTextFormAuth(
                                        sufixtext: "m".tr,
                                        isNumber: true,
                                        valid: (val) {
                                          return validInput(
                                              val!, 5, 100, "hauteur_porte");
                                        },
                                        mycontroller: controller.hauteur_porte,
                                        hintText: "Hauteur du porte *",
                                        iconData: FontAwesomeIcons.arrowsAltV,
                                        labelText: "Prénom",
                                      ),
                                    )
                                  ],
                                ),*/
                              ])
                            : SizedBox.shrink()),
                        Obx(() =>
                            controller.selectedTypeMur == "mur avec fenetre"
                                ? Column(
                                    children: [
                                      CustomTextFormAuth(
                                        isNumber: true,
                                        valid: (val) {
                                          return validInput(
                                              val!, 5, 100, "nombre_fenetre");
                                        },
                                        mycontroller: controller.largeur_porte,
                                        hintText: "Le nombre du fenetre *",
                                        iconData: null,
                                        labelText: "nombre du fenetre",
                                      ),

                                      /*
                                  Expanded(
                                    child:   CustomTextFormAuth(
                                  isNumber: true,
                                  valid: (val) {
                                    return validInput(
                                        val!, 5, 100, "nombre_porte");
                                  },
                                  mycontroller: controller.largeur_porte,
                                  hintText: "Le nombre du porte *",
                                  iconData: null,
                                  labelText: "nombre du porte",
                                ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: CustomTextFormAuth(
                                      sufixtext: "m".tr,
                                      isNumber: true,
                                      valid: (val) {
                                        return validInput(
                                            val!, 5, 100, "hauteur_fenetre");
                                      },
                                      mycontroller: controller.hauteur_fenetre,
                                      hintText: "Hauteur du fenetre *",
                                      iconData: FontAwesomeIcons.arrowsAltV,
                                      labelText: "Prénom",
                                    ),
                                  )*/
                                    ],
                                  )
                                : SizedBox.shrink()),
                        Obx(() => controller.selectedTypeMur ==
                                "mur avec porte et fenetre"
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormAuth(
                                          sufixtext: "m".tr,
                                          isNumber: true,
                                          valid: (val) {
                                            //premier parametre yedi val
                                            return validInput(
                                                val!, 5, 50, "largeur_porte");
                                          },
                                          mycontroller:
                                              controller.largeur_portee,
                                          hintText: "Largeur du porte *",
                                          iconData: FontAwesomeIcons.arrowsAltH,
                                          labelText: "Nom",
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: CustomTextFormAuth(
                                          sufixtext: "m".tr,
                                          isNumber: true,
                                          valid: (val) {
                                            return validInput(
                                                val!, 5, 100, "hauteur_porte");
                                          },
                                          mycontroller:
                                              controller.hauteur_portee,
                                          hintText: "Hauteur du porte *",
                                          iconData: FontAwesomeIcons.arrowsAltV,
                                          labelText: "Prénom",
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormAuth(
                                          sufixtext: "m".tr,
                                          isNumber: true,
                                          valid: (val) {
                                            //premier parametre yedi val
                                            return validInput(
                                                val!, 5, 50, "largeur_fenetre");
                                          },
                                          mycontroller:
                                              controller.largeur_fenetree,
                                          hintText: "Largeur du fenetre *",
                                          iconData: FontAwesomeIcons.arrowsAltH,
                                          labelText: "Nom",
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: CustomTextFormAuth(
                                          sufixtext: "m".tr,
                                          isNumber: true,
                                          valid: (val) {
                                            return validInput(val!, 5, 100,
                                                "hauteur_fenetre");
                                          },
                                          mycontroller:
                                              controller.hauteur_fenetree,
                                          hintText: "Hauteur du fenetre *",
                                          iconData: FontAwesomeIcons.arrowsAltV,
                                          labelText: "Prénom",
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            : SizedBox.shrink()),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Est-ce qu'il y a des objets accrochés sur la cloison ? : ",
                                style: TextStyle(
                                    color: Colors.black), // Default text color
                              ),
                              TextSpan(
                                text: "*",
                                style: TextStyle(
                                    color: Colors
                                        .red), // Red color for the asterisk
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              child: Obx(() => RadioListTile(
                                    title: Text('Oui'),
                                    value: 'Oui',
                                    groupValue: controller.selectedValue.value,
                                    activeColor: Colors.blue,
                                    onChanged: (String? value) {
                                      controller.selectedValue.value = value!;
                                    },
                                  )),
                            ),
                            Container(
                              child: Obx(() => RadioListTile(
                                    activeColor: Colors.blue,
                                    title: Text('Non'),
                                    value: 'Non',
                                    groupValue: controller.selectedValue.value,
                                    onChanged: (String? value) {
                                      controller.selectedValue.value = value!;
                                    },
                                  )),
                            ),
                            Obx(() {
                              if (controller.selectedValue.value == 'Oui') {
                                return Column(
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "Choissir le type des objets accrochet : ",
                                            style: TextStyle(
                                                color: Colors
                                                    .black), // Default text color
                                          ),
                                          TextSpan(
                                            text: "*",
                                            style: TextStyle(
                                                color: Colors
                                                    .red), // Red color for the asterisk
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                border: Border.all(
                                                    color:
                                                        AppColor.primaryColor)),
                                            child: Obx(() =>
                                                DropdownButton<String>(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  padding: EdgeInsets.all(5),
                                                  isExpanded: true,
                                                  underline: SizedBox(),
                                                  value:
                                                      controllerAccrochageObjet
                                                          .selectedValue.value,
                                                  items: <String>[
                                                    'meuble cuisine',
                                                    'télévision',
                                                    'radiateur',
                                                    'barre des support',
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Row(children: [
                                                        // Add your icon here
                                                        SizedBox(
                                                            width:
                                                                4), // Add some spacing
                                                        Text(value),
                                                      ]),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    if (newValue != null) {
                                                      controllerAccrochageObjet
                                                          .setSelectedValue(
                                                              newValue);
                                                      controller.selectedOption
                                                          .value = newValue!;
                                                    }
                                                  },
                                                )),
                                          ),
                                        ]),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                );
                              } else {
                                return Container(); // Empty container when 'Non' is selected or no value is selected
                              }
                            }),
                          ],
                        ),
                        CustomButtomAuth(
                          text: "calculer".tr,
                          onPressed: () {
                            controller.GoToCalcul();
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
