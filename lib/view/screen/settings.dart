import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hgp/controller/auth/settings_controller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/core/constant/imageasset.dart';
import 'package:hgp/core/functions/validinput.dart';
import 'package:hgp/view/widget/auth/custombuttomauth.dart';
import 'package:hgp/view/widget/auth/customtextformauth.dart';
import 'package:hgp/view/widget/custom_bottomsheet.dart';
import 'package:hgp/view/widget/setting.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    bool _customIcon = false;

    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(
              top: 10,
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
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(5),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_active_outlined,
                      size: 30,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(5),
                  child: IconButton(
                    onPressed: () {
                      customBottomSheet("about".tr, Icons.close);
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Paramétres :",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                  child: Column(children: [
                customListTile(
                    icon: Icons.exit_to_app,
                    text: "Réclamation",
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          padding: EdgeInsets.all(25),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              )),
                          height: 700,
                          width: Get.width,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Réclamation"),
                                  IconButton(
                                    icon: Icon(Icons.close),
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
                                  TextField(
                                    maxLines:
                                        4, // Set maxLines to null for a textarea
                                    decoration: InputDecoration(
                                      labelText: 'Observation',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  CustomButtomAuth(
                                    text: "Envoyer",
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        enterBottomSheetDuration: Duration(seconds: 2),
                        exitBottomSheetDuration: Duration(seconds: 1),
                      );
                    }),
                Divider(),
                customListTile(
                    icon: Icons.exit_to_app,
                    text: "Changer la langue",
                    onTap: () {})
              ]))),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
                child: Column(children: [
              ListTile(
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      padding: EdgeInsets.all(25),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          )),
                      height: 700,
                      width: Get.width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("about".tr),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/images/hgpp.jpg",
                            width: 100,
                          ),
                          Text(
                            "HASNAOUI Gypsum Panel",
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Se connecter avec nous",
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 34),
                          GestureDetector(
                            onTap: () {
                              launch("mailto:info@hgp-dz.com");
                            },
                            child: Row(
                              children: [
                                Icon(Icons.mail_outline),
                                SizedBox(width: 10),
                                Text("Contacter nous")
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              launch("https://www.hgp-dz.com/");
                            },
                            child: Row(
                              children: [
                                Icon(Icons.language),
                                SizedBox(width: 10),
                                Text("Visitez notre site")
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              launch(
                                  "https://web.facebook.com/hasnaoui.gypsum.panel/?_rdc=1&_rdr");
                            },
                            child: Row(
                              children: [
                                FaIcon(FontAwesomeIcons.facebook),
                                SizedBox(width: 10),
                                Text("Likez notre page sur Facebook")
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              launch(
                                  "https://www.youtube.com/watch?v=kP5IZyYD8aM");
                            },
                            child: Row(
                              children: [
                                FaIcon(FontAwesomeIcons.youtube),
                                SizedBox(width: 10),
                                Text("Regardez nos vidéos sur youtube")
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              launch(
                                  "https://maps.app.goo.gl/asZZw6epXHtDoujh8");
                            },
                            child: Row(
                              children: [
                                FaIcon(FontAwesomeIcons.map),
                                SizedBox(width: 10),
                                Text("Localisation")
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    enterBottomSheetDuration: Duration(seconds: 2),
                    exitBottomSheetDuration: Duration(seconds: 1),
                  );
                },
                trailing: Icon(Icons.help_outline_rounded),
                title: Text("about".tr),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      padding: EdgeInsets.all(25),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          )),
                      height: 700,
                      width: Get.width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("contact".tr),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    enterBottomSheetDuration: Duration(seconds: 2),
                    exitBottomSheetDuration: Duration(seconds: 1),
                  );
                },
                trailing: Icon(Icons.phone_callback_outlined),
                title: Text("Contact nous"),
              ),
              Divider(),
              customListTile(
                  icon: Icons.share,
                  text: "Partager notre application",
                  onTap: () {
                    Share.share("com.baraka.hgp");
                  }),
            ])),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              child: Column(children: [
                customListTile(
                    icon: Icons.confirmation_num_rounded,
                    text: "Confidentialité",
                    onTap: () {
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
                          child: ListView(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Confidentialité",
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
                                  Text(
                                    "Politique de confidentialité :",
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Informations que nous collectons :",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                      "Lorsque vous utilisez notre application ou nos services, nous pouvons collecter les informations suivantes auprès de vous :"),
                                  Text(
                                      "informations personnelles: cela inclut votre nom, votre adresse e-mail, votre numéro de téléphone et d’autres d’informations que vous nous fournissez lorsque vous inscrivez à nos services. Usage informations: This includes informations about how you use our website and services, including your IP address, browser type ,and the pages you visit"),
                                  Text(
                                    "Comment nous utilisons vos informations:",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                      "Nous utilisons des mesures de sécurité raisonnables pour protéger vos informations personnelles contre tout accès, utilisation ou divulgation non autorisés. Cependant, aucune méthode de stockage électronique "),
                                  Text(
                                    "Comment nous protégeons vos informations:",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Nous utilisons des mesures de sécurité raisonnables pour protéger vos informations personnelles contre tout accés, utilisation ou divulgation non autorisés.Cependant, aucune méthode de transmission sur Internet ou méthode de stockage électronique n’est sécurisée à 100%, et nous ne pouvons garantir la sécurité absolue de vos informations personnelles.",
                                  ),
                                  Text(
                                    "Partage informations:",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                      "Nous ne vendons, ne louons ni ne partageons vos informations personnelles avec des tiers, sauf tel que décrit dans la présente politique de confidentialité. Nous pouvons partager vos informations personnelles avec nos fournisseurs de services qui ont besoin d’acceder à vos informations personnelles si nous pensons de bonne foi que la divulgation est nécessaire pour se conformer à la loi, à la réglementation, à la procédure judiciare ou à la demande gouvernementale en vigueur "),
                                  Text(
                                    "Vos droits :",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                      "Vous avez le droit d'accéder, de corriger ou de supprimer vos informations personnelles que nous détenons à votre sujet. Vous pouvez également avoir le droit de vous opposer ou de restreindre le traitement de vos informations personnelles et de recevoir une copie de vos informations personnelles dans un format structuré et lisible par machine."),
                                  Text(
                                    "Contactez-nous :",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                      "Si vous avez des questions ou des préoccupations concernant cette politique de confidentialité, ou si vous souhaitez exercer vos droits concernant vos informations personnelles, veuillez nous contacter via ce site Web, l'application mobile")
                                ],
                              )
                            ],
                          ),
                        ),
                        isScrollControlled: true,
                        enterBottomSheetDuration: Duration(seconds: 2),
                        exitBottomSheetDuration: Duration(seconds: 1),
                      );
                    }),
                Divider(),
                customListTile(
                    icon: Icons.security_outlined,
                    text: "Sécurité",
                    onTap: () {
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
                          child: ListView(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sécurité",
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
                              const Column(
                                children: [
                                  Text(
                                    "Nos conditions :",
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Utilisation de notre application et de nos services :",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                      "Vous ne pouvez utiliser notre application et nos services qu'à des fins légales et conformément au présent accord. Vous vous engagez à ne pas utiliser notre site web ou nos services:"),
                                  Text(
                                      "D'une manière qui viole toute loi ou réglementation fédérale, étatique, locale ou internationale applicable. Pour s'engager dans une conduite qui restreint ou empéche l'utilisation ou la jouissance de notre application ou de nos services pae quiconque, ou qui peut nuire à HGP ou à d'autres utilisateurs de notre application ou de nos services. Se faire passer pour ou tenter de se faire passer pour HGP, un employé de HGP, un autre utilisateur ou toute autre personne ou entité."),
                                  Text(
                                    "Propriété intellectuelle :",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                      "Notre application etnos services, y compris tous les contenus, graphiques, logos et marques déposées, sont la propriété de HGP ou de ses concédants et sont protégés par le droit d'auteur, les marques déposées et d'autres lois sur la propriété intellectuelle. Vous ne pouvez utiliser aucune de nos propriétés intellectuelles sans notre autorisation écrite préalable. "),
                                  Text(
                                    "Avis de non-responsabilité et limitations de responsabilité:",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Notre application et nos services sont fournis 'tels quels' sans aucune garantie d'aucune sorte, expresse ou implicite. Nous ne garantissons pas que notre site Web ou nos services seront exempts d'erreurs ou ininterrompus, ou qu'ils répondront à vos exigences ou attentes. Nous se sommes pas responsables des dommages résultant de votre utilisation de notre application ou de nos services.",
                                  ),
                                  Text(
                                    "Paiement et facturation :",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                      "Si vous achetez l'un de nos services, vous acceptez de payer les frais associés à ces servoces. Nous pouvons modifier nos frais à tout moment, mais nous vous informerons de tout changement de frais avant qu'il n'entre en vigueur."),
                                  Text(
                                    "Résiliation :",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                      "Nous pouvons résilier le présent accord à tout moment pour n'importe quelle raison sans préavis. En cas de résiliation , vous devez immédiatement cesser d'utiliser notre application et nos services."),
                                  Text(
                                    "Droit applicable et juridiction :",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                      "Le présent Accord sera régi et interprété conformément aux lois algériennes, sans égard à ses dispositions en matière de conflit de lois. Tout litige découlant de ou lié au présent Accord sera résolu devant les tribunaux étatiques ou fédéraux situés en Algérie."),
                                  Text(
                                    "Modifications du présent accord :",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                      "Nous pouvons mettre à jour cet accord de tempsà autre. Si nous apportons des modifications importantes au présent accord, nous vous en informerons par e-mail ou en publiant un avis sur notre application.")
                                ],
                              )
                            ],
                          ),
                        ),
                        isScrollControlled: true,
                        enterBottomSheetDuration: Duration(seconds: 2),
                        exitBottomSheetDuration: Duration(seconds: 1),
                      );
                    }),
                Divider(),
                customListTile(
                    icon: Icons.help_outline,
                    text: "Aide",
                    onTap: () {
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
                          child: ListView(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Aide",
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
                                  ExpansionTile(
                                    title: const Text(
                                      "Qu'est-ce que HGP ?",
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontSize: 17),
                                    ),
                                    trailing: Obx(() {
                                      return controller.isExpanded.value
                                          ? const Icon(
                                              FontAwesomeIcons.circleMinus,
                                              size: 20,
                                              color: AppColor.grey,
                                            )
                                          : const Icon(
                                              FontAwesomeIcons.circlePlus,
                                              size: 20,
                                              color: AppColor.primaryColor,
                                            );
                                    }),
                                    onExpansionChanged: (bool expanded) {
                                      controller.toggleExpansion();
                                    },
                                    children: const [
                                      Text(
                                        "SPA HASNAOUI GYPSUM PANEL est une filiale du GROUPE DES SOCIÉTÉS HASNAOUI spécialisée dans la production de panneaux de plâtre fibro renforcés. Ces panneaux massifs avec fibres de verre sont destinés à la réalisation d’ouvrages intérieurs verticaux, de cloisons, de doublages.",
                                        style: TextStyle(color: AppColor.grey),
                                        textAlign: TextAlign.justify,
                                      )
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: const Text(
                                      "Domaines d’utilisation ?",
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontSize: 17),
                                    ),
                                    trailing: Obx(() {
                                      return controller.isExpandedTwo.value
                                          ? const Icon(
                                              FontAwesomeIcons.circleMinus,
                                              size: 20,
                                              color: AppColor.grey,
                                            )
                                          : const Icon(
                                              FontAwesomeIcons.circlePlus,
                                              size: 20,
                                              color: AppColor.primaryColor,
                                            );
                                    }),
                                    onExpansionChanged: (bool expandedTwo) {
                                      controller.toggleExpansionTwo();
                                    },
                                    children: const [
                                      Text(
                                        "Logements individuels et collectifs Bâtiments commerciaux Bâtiments industriels Bureaux Constructions soumises à des conditions particulières d’hygiène, de qualité de l’air, d'acoustique et de sécurité : Hôtellerie, Établissements de santé, Établissements scolaires, Salles de conférence, Salles de spectacle.",
                                        style: TextStyle(color: AppColor.grey),
                                        textAlign: TextAlign.justify,
                                      )
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: const Text(
                                      "Comment pouvons-nous contacter HGP ?",
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontSize: 17),
                                    ),
                                    trailing: Obx(() {
                                      return controller.isExpandedThree.value
                                          ? const Icon(
                                              FontAwesomeIcons.circleMinus,
                                              size: 20,
                                              color: AppColor.grey,
                                            )
                                          : const Icon(
                                              FontAwesomeIcons.circlePlus,
                                              size: 20,
                                              color: AppColor.primaryColor,
                                            );
                                    }),
                                    onExpansionChanged: (bool expandedThree) {
                                      controller.toggleExpansionThree();
                                    },
                                    children: const [
                                      Text(
                                        "Vous pouvez nous contacter en nous envoyant un email à notre adresse support@brainerx.com ou par téléphone au +21355000000",
                                        style: TextStyle(color: AppColor.grey),
                                      )
                                    ],
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
                    }),
                Divider(),
                customListTile(
                    icon: Icons.exit_to_app,
                    text: "Se déconnecter",
                    onTap: () {
                      controller.logout();
                    }),
              ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "Copyright 2024 - DSI(Devops) - Groupe des Sociétés HASNAOUI ",
                    style: TextStyle(color: AppColor.primaryColor),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
