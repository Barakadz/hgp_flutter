import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hgp/controller/controller_sliderproject.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/core/constant/routes.dart';
import 'package:hgp/core/functions/validinput.dart';
import 'package:hgp/view/screen/language/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hgp/view/widget/auth/custombuttomauth.dart';
import 'package:hgp/view/widget/auth/customtextformauth.dart';
import 'package:hgp/view/widget/auth/loginauth.dart';

class HomePage extends GetView {
  HomePage({Key? key}) : super(key: key);
  final SliderController apiController = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSize = screenWidth * 0.05; // Adjust the multiplier as needed

    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 5,
            ),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "hgp".tr,
                          style: const TextStyle(
                              fontSize: 19,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w500),
                        ))),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(6),
                  child: IconButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          padding: EdgeInsets.all(25),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              )),
                          width: Get.width,
                          height: Get.height - 300,
                          child: ListView(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Notifications",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.chevronDown),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                children: [],
                              )
                            ],
                          ),
                        ),
                        isScrollControlled: true,
                        enterBottomSheetDuration: Duration(seconds: 2),
                        exitBottomSheetDuration: Duration(seconds: 1),
                      );
                    },
                    icon: Icon(
                      Icons.notifications_active_outlined,
                      size: 30,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(6),
                  child: IconButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          padding: EdgeInsets.all(25),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              )),
                          width: Get.width,
                          height: Get.height - 300,
                          child: ListView(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Mon profile",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.chevronDown),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(children: [
                                    Expanded(
                                      child: CustomTextFormAuth(
                                        isNumber: false,
                                        valid: (val) {
                                          //premier parametre yedi val
                                          return validInput(val!, 5, 50, "nom");
                                        },
                                        hintText: "nom".tr,
                                        iconData: Icons.person_2_outlined,
                                        labelText: "Nom",
                                        mycontroller: null,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: CustomTextFormAuth(
                                        isNumber: false,
                                        valid: (val) {
                                          return validInput(
                                              val!, 5, 100, "prenom");
                                        },
                                        hintText: "prenom".tr,
                                        iconData: Icons.person_2_outlined,
                                        labelText: "Prénom",
                                        mycontroller: null,
                                      ),
                                    )
                                  ]),
                                  CustomTextFormAuth(
                                    isNumber: false,
                                    valid: (val) {
                                      return validInput(
                                          val!, 5, 100, "adresse");
                                    },
                                    hintText: "adresse".tr,
                                    iconData: Icons.location_on_outlined,
                                    labelText: "adresse",
                                    mycontroller: null,
                                  ),
                                  CustomTextFormAuth(
                                    isNumber: false,
                                    valid: (val) {
                                      return validInput(val!, 5, 100, "email");
                                    },
                                    hintText: "mail".tr,
                                    iconData: Icons.email_outlined,
                                    labelText: "Email",
                                    mycontroller: null,
                                  ),
                                  CustomTextFormAuth(
                                    isNumber: true,
                                    valid: (val) {
                                      return validInput(
                                          val!, 10, 10, "telephone");
                                    },
                                    hintText: "telephone".tr,
                                    iconData: Icons.call_outlined,
                                    labelText: "téléphone",
                                    mycontroller: null,
                                  ),
                                  CustomButtomAuth(
                                    text: "Mettre à jour",
                                    onPressed: () {
                                      controller.signUp();
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        isScrollControlled: true,
                        enterBottomSheetDuration: Duration(seconds: 2),
                        exitBottomSheetDuration: Duration(seconds: 1),
                      );
                    },
                    icon: Icon(
                      Icons.person_outline,
                      size: 30,
                      color: AppColor.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ListTile(
                    title: Text(
                      "slogo".tr,
                      style: TextStyle(
                          color: Colors.white, fontSize: fontSize - 5),
                    ),
                    subtitle: Text(
                      "slogo1".tr,
                      style: TextStyle(
                          color: Colors.white, fontSize: fontSize - 5),
                    ),
                  ),
                  height: 150,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                  top: -10,
                  right: -15,
                  child: Container(
                    height: 175,
                    width: 175,
                    decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(160)),
                    child: Image.asset(
                      "assets/images/hgp_home.png",
                      width: 200,
                    ),
                  ),
                )
              ],
            ),
          ),
          /* Container(
            width: 200,
            height: 200,
            child: Obx(() {
              if (apiController.data.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: apiController.data.length,
                  itemBuilder: (context, index) {
                    var item = apiController.data[index];
                    return Card(
                      child: Text(item['titre']),
                    );
                  },
                );
              }
            }),
          ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  "prjc".tr,
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "voir_tout".tr,
                ),
              ),
            ],
          ),
          Obx(() => CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: apiController.myList.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;

                  return Container(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: <Widget>[
                            Image.network(item,
                                fit: BoxFit.cover, width: 1000.0),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: Text(
                                  apiController.titre_slide[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  "produit1".tr,
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "voir_tout".tr,
                ),
              ),
            ],
          ),
          Obx(
            () => SizedBox(
              height: 220,
              child: ListView.builder(
                itemCount: apiController.myList_produit.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Image.network(
                            apiController.myList_produit[i],
                            height: 196,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(apiController.titre_produit[i])
                        ],
                      ));
                },
              ),
            ),
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  "syst".tr,
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "voir_tout".tr,
                ),
              ),
            ],
          ),
          Obx(
            () => SizedBox(
              height: 220,
              child: ListView.builder(
                itemCount: apiController.myList_produit.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Image.network(
                            apiController.myList_system[i],
                            height: 196,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(apiController.titre_system[i])
                        ],
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
