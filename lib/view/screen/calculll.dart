 
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hgp/controller/auth/calcul_controller.dart';
import 'package:hgp/controller/auth/calculll_controller.dart';
import 'package:hgp/controller/auth/signup_controller.dart';
import 'package:hgp/core/constant/color.dart';
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
import 'package:path_provider/path_provider.dart';
 import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';
 import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart' as svg;
import 'package:pdf/pdf.dart';
class Item {
 
  String type;
  String position;
double largeur_chutte;
  double hauteur_chute;
  Item({required this.type, required this.position,required this.largeur_chutte,required this.hauteur_chute});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      type: json['type'],
      position: json['position'],
      largeur_chutte: json['largeur_chutte'],
      hauteur_chute: json['hauteur_chute'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'position': position,
      'largeur_chutte':largeur_chutte,
      'hauteur_chute':hauteur_chute
    };
  }
} 
class Calculll extends StatelessWidget {
  const Calculll({super.key});







bool estPair(double nombre) {
  return nombre % 2 == 0;
}
bool estPairr(int nombre) {
  return nombre % 2 == 0;
}

bool isInteger(num value) {
  return value is int || value == value.toInt();
}

 
  @override
  Widget build(BuildContext context) {
    //7a9ne controller
   // final largeur = Get.arguments['largeur'].toString();

    final CalculllControllerImp controller = Get.put(CalculllControllerImp(),permanent: true);


  Future<void> generatePdf() async {
 
 


    final pdf = pw.Document();
//======= image in pdf
  // Load the image from assets
    final ByteData bytes = await rootBundle.load('assets/images/hgpp.jpg');
    final Uint8List byteList = bytes.buffer.asUint8List();
      // Create an image object
    final image = pw.MemoryImage(byteList);
//======== end image in pdf


// Your SVG string
    const svgString = '''
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
      <path fill="#005890" d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z"/>
    </svg>
    ''';
    const svgMail='''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"> <path fill="#27649d" d="M64 112c-8.8 0-16 7.2-16 16l0 22.1L220.5 291.7c20.7 17 50.4 17 71.1 0L464 150.1l0-22.1c0-8.8-7.2-16-16-16L64 112zM48 212.2L48 384c0 8.8 7.2 16 16 16l384 0c8.8 0 16-7.2 16-16l0-171.8L322 328.8c-38.4 31.5-93.7 31.5-132 0L48 212.2zM0 128C0 92.7 28.7 64 64 64l384 0c35.3 0 64 28.7 64 64l0 256c0 35.3-28.7 64-64 64L64 448c-35.3 0-64-28.7-64-64L0 128z"/></svg>
''';
 
 Future<Uint8List> _svgStringToPng(String svgString, double width, double height) async {
    // Convert the SVG string to a DrawableRoot
    final drawableRoot = await svg.svg.fromSvgString(svgString, svgString);

    // Create a Picture from the DrawableRoot
    final picture = await drawableRoot.toPicture(size: Size(width, height));

    // Create an Image from the Picture
    final img = await picture.toImage(width.toInt(), height.toInt());

    // Convert the Image to PNG bytes
    final byteData = await img.toByteData(format: ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }
    // Convert the SVG string to PNG bytes
    final pngBytes = await _svgStringToPng(svgString, 400, 400); // Specify width and height
    final pngMail = await _svgStringToPng(svgMail, 400, 400); // Specify width and height
    final pngDessin = await _svgStringToPng(controller.svgStringg.value, 400, 400); // Specify width and height


    final DrawableRoot svgRoot = await svg.svg.fromSvgString(controller.svgStringg.value, controller.svgStringg.value);





// SVG data
    final String rawSvg = '''
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
        <path fill="#005890" d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z"/>
      </svg>
    ''';

  

        

    pdf.addPage(
      pw.MultiPage(
        header: (pw.Context context) {
          return pw.Container(
            alignment: pw.Alignment.center,
            margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const pw.BoxDecoration(
              border: pw.Border(
                bottom: pw.BorderSide(width: 0.5, color: PdfColors.grey),
              ),
            ),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Image(image, width: 70, height: 60),

pw.Container(child: pw.Row(children: [
    
                
  pw.Image(
              pw.MemoryImage(pngBytes),
              width: 12,
              height: 12,
            ),
            pw.SizedBox(width: 3),
            pw.Text("048 77 01 40"),
            pw.SizedBox(width: 10),
            pw.Image(
              pw.MemoryImage(pngMail),
              width: 12,
              height: 12,
            ),
            pw.SizedBox(width: 3),
            pw.Text("info@hgp-dz.com"),
            
],))
               
              ],
            ),
          );
        },
        footer: (pw.Context context) {
          return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            padding: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            decoration: const pw.BoxDecoration(
              border: pw.Border(top: pw.BorderSide(width: 0.5, color: PdfColors.grey)),
            ),
            child: pw.Text(
              'Page ${context.pageNumber} of ${context.pagesCount}',
              style: pw.TextStyle(color: PdfColors.grey),
            ),
            
          );
        },
        build: (pw.Context context) => [
         pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Container(child: 
            pw.Row(children: [
   pw.Text("Numéro de facture :", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(width: 5),
                  pw.Text('10760531', style: pw.TextStyle(fontSize: 14)), // Example amount
       
            ])
            ),
              pw.Container(child: 
            pw.Column(children: [
              pw.Row(children: [
                pw.Text("Date du facture :", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(width: 20),
                     pw.Text('29/07/2024', style: pw.TextStyle(fontSize: 14)), // Example amount
              ]),
        pw.Row(children: [
                pw.Text("Conditions de paiement :", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(width: 05),
                     pw.Text('7 jours', style: pw.TextStyle(fontSize: 14)), // Example amount
              ]),
               pw.Row(children: [
                pw.Text("Date d'échéance :", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(width: 20),
                     pw.Text('05/07/2024', style: pw.TextStyle(fontSize: 14)), // Example amount
              ]),
            ])
            )  
         ])
         ,
          pw.SizedBox(height: 20),
          pw.Table.fromTextArray(
                headers: ['Produit', 'Unité', 'Quantité', 'Prix Unitaire', 'TVA', 'Total'],
            data: [
              ['Plaque HTB25', 'U', '60','210','0.19%','210'],
              ['Colle Platre', 'KG', '12','210','0.19%','210'],
              ['Rail', 'U', '50','210','0.19%','210'],
              ['Montant', 'U', '77','210','0.19%','210'],
              ['Cheville à frappe 6/40', 'U', '89','210','0.19%','210'],
              ['Vis TTPC 45', 'U','23','210','0.19%','210'],
              ['Vis TRPF 9.5', 'U', '54','210','0.19%','210'],
              ['Isolation en laine de roche', 'M²', '86','210','0.19%','210'],
 
            ],
            headerStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.white, // Set header text color
                ),
                cellStyle: pw.TextStyle(color: PdfColors.black), // Set cell text color
                headerDecoration: pw.BoxDecoration(
                  color: PdfColors.grey600, // Set header background color
                ),
                
          ),

  pw.SizedBox(height: 10),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text("Net Total :", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(width: 10),
                  pw.Text('100.00 DA', style: pw.TextStyle(fontSize: 14)), // Example amount
                ],
              ),
               pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text("Vat 19.0% :", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(width: 10),
                  pw.Text('18.00 DA', style: pw.TextStyle(fontSize: 14)), // Example amount
 ],
              ),
 // Divider wrapped in a Row for alignment
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Container(
                    width: 136, // Set the width of the divider
                    child: pw.Divider(thickness: 2.5, color: PdfColors.black),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text("Total :", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(width: 10),
                  pw.Text('82.00 DA', style: pw.TextStyle(fontSize: 14)), // Example amount
                ],),
              pw.SizedBox(height: 20),
                   pw.Row(
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
pw.Text("Adresse:",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)), 
pw.SizedBox(width: 10),                     
pw.Text("Zone Industrielle, Sidi Bel Abbès 22000"),                      

                   ])  
,
pw.Center(
                    child: pw.Container(
                      width: 400,
                      height: 400,
                      child: pw.SvgImage(
                        svg: controller.svgStringg.value,
                      ),
                    ),
                  ),           pw.Image(
              pw.MemoryImage(pngDessin),
              
            ),
        ],
      ),
    );
 
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );



    
  }

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
           
            /*   Image.asset(
              "assets/images/hgpresult.PNG",
            ),*/

   Row(
                           children: [
                            Expanded(
                              flex: 40,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10.0,left: 10), // Set the top margin here
                                child: Column(
                                  children: [ RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Largeur d'un cloisson : ",
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
                                        return validInput(val!, 5, 100, "hauteur");
                                      },
              mycontroller: controller.largeurController,
                                      hintText: "Entrer votre largeur",
                                      iconData: FontAwesomeIcons.arrowsAltH,
                                      labelText: "hauteur",
                                       onChanged: (value) {
                                        controller.updateLargeurFromController();
    // Call the reload function from the controller
    controller.rr(); // Replace 'rr' with the actual method name you want to call
  },
                                    ),
                                  ],
                                ),
                              ),
                            ),
Expanded(
                              flex: 40,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10.0,left: 10,right: 10), // Set the top margin here

                                child: Column(
                                  children: [
                                    RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Hauteur d'un cloisson : ",
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
                                        return validInput(val!, 5, 100, "hauteur");
                                      },
              mycontroller: controller.hauteurController,
                                      hintText: "hauteur_calcul".tr,
                                      iconData: FontAwesomeIcons.arrowsAltV,
                                      labelText: "hauteur",
 onChanged: (value) {
  controller.add();
                                        controller.updateHauteurFromController();
    // Call the reload function from the controller
    controller.rr(); // Replace 'rr' with the actual method name you want to call
  },                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),

Container(
                                margin: EdgeInsets.only(
                                   left: 10,right: 10), // Set the top margin here

                                child:
Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Choissir le type de Montant : ",
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
                                          controller.selectedValueTypeMontant.value,
                                      items: <String>[
                                        'M35/48',
                                        'M40/70',
                                        'M40/90'
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
                                              .setSelctedTypeMontant(newValue);
                                         
                                        }
                                      },
                                    )),
                              ),
                            ]),
),
SizedBox(height: 10,),
Container(
                                margin: EdgeInsets.only(
                                   left: 10,right: 10), // Set the top margin here

                                child:
Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Configurations des montants : ",
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
 controller.selectedConfigurationMontant.value.isNotEmpty
                    ? controller.selectedConfigurationMontant.value
                    : null, 
                                items: controller.dropdownItems.map<DropdownMenuItem<String>>(
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
                                              .setSelectedConfigurationMontant(newValue);
                                         
                                        }
                                      },
                                    )),
                              ),
                            ]),
),
SizedBox(height: 10,),

Container(
                                margin: EdgeInsets.only(
                                   left: 10,right: 10), // Set the top margin here

                                child:
Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Entraxe : ",
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
 controller.selectedEntraxe.value.isNotEmpty
                    ? controller.selectedEntraxe.value
                    : null, 
                                items: controller.EntaxeItem.map<DropdownMenuItem<String>>(
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
                                              .setSelectedEntraxe(newValue);
                                         
                                        }
                                      },
                                    )),
                              ),
                            ]),
),




             Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                   Obx(() {
          String svgString = controller.getSvgString();
          if (svgString.isEmpty) {
            return Text('No SVG to display');
          } else {
            return SvgPicture.string(
              svgString,
               width: Get.width - 150,
                    height: Get.height - 370,
              placeholderBuilder: (context) => CircularProgressIndicator(),
            );
          }
        }),
                  SizedBox(height: 4),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
Column(children: [
  Row(
    children:  
  [Container(width: 50,height: 30,     decoration: BoxDecoration(
              color: Color(0xFFC1BABA), // Background color
              border: Border.all(
                color: Colors.red, // Border color
                width: 3.0, // Border width
              ))
),
SizedBox(width: 10),
Text("Plaque HGP ")
],),
SizedBox(height: 10,),
 Row(
    children:  
  [Container(width: 50,height: 30,    decoration: BoxDecoration(
 color:Colors.yellow,
               border: Border.all(
                color: Colors.red, // Border color
                width: 3.0, // Border width
              ))         
),
SizedBox(width: 10),
Text("Plaque découpé ")
],),
  
  ],),
  Column(children: [
  Text("Affichage des montants :"),
 Obx(
          () => Switch(
            value: controller.isSwitched.value,
            onChanged: (value) {
                                 controller.isSwitched.value = value;
if (value) {
      // If switched on, add montant to SVG
      controller.addMontantToSVG();
    } else {
      // If switched off, remove montant from SVG
      controller.removeMontantFromSVG();
    }

              },
          ),),
  ],),
 
 
                       Column(children: [
                        Icon(Icons.arrow_back),
                      Text("Depart montant"),
 Container(
  width: 100,
  height: 70,
     child: CustomTextFormAuth(sufixtext:"cm",
                                        isNumber: true,
                                        valid: (val) {
                                          return validInput(val!, 5, 100, "montant");
                                        },
                                           onChanged: (val) {
            controller.onChanged(val, 5, 100, "montant");
          },
              mycontroller: controller.departController,
                                        hintText: "depart montant",
                                        iconData: Icons.arrow_back,
                                        labelText: "hauteur",
                                      ),
 ),
              
               
               
                      ],)
  
                    ],
                  ),



 MaterialButton(
          onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Informations Détaillées :'),
                      content: Column(
                        children: [
                          
                          Column(
                            children: [
                      //           Text("nombre de plaque sans decoupe :$nombre_plaque_sansdecoupe"),
                                 Text("nombre de plaque decoupe :"),
                                 Text("Total des plaques utilisées pour cette facade est :",style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold),),

                            ],
                          ),
                         
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Fermer'),
                        ),
                      ],
                    );
                  },
                );
            },
            color: Colors.blue,
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child:const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.info, color: Colors.white),
                SizedBox(width: 8),
                Text('Informations détaillées sur le dessin'),
              ],
            ),
          ),
     SizedBox(height: 4,),


ElevatedButton(
            onPressed: () {
              generatePdf();
            },
            child: Text('Generate PDF'),
          ),








//Text(controller.largeur.text),
  CustomButtomAuth(
              text: "Afficher la positionnement",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Possitionnement des produits'),
                      content: Column(
                        children: [
                          Image.asset(
                            "assets/images/hgpresult.PNG",
                            width: 250,
                          ),
                          Row(
                            children: [
                              const Text("1. Rail"),
                              const Text("     2. Cheville à frappe"),
                            ],
                          ),
                          Row(children: [
                            const Text("3. Montant"),
                            const Text("     4. Panneau HGP"),
                          ]),
                          Row(children: [
                            const Text("5. Guide panneau- Corniére 25"),
                            const Text("     6. Vis TRPF 9.5"),
                          ]),
                          Row(children: [
                            const Text("7. Vis TTPC 45"),
                            const Text("     8. Colle - Platre HGP"),
                          ]),
                          Row(children: [
                            const Text("9. Isolant en laine minérale"),
                            const Text("     10. Bande acoustique"),
                          ]),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Fermer'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),

                  Table(
                    border: TableBorder.all(color: Colors.black),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: AppColor.primaryColor),
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Produit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Unité',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Résultats',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              color: AppColor
                                  .grey, // Set the background color here
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Plaque HTB25',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'U',
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    "ee")),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              color: AppColor
                                  .grey, // Set the background color here
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Colle Platre',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'KG',
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("dd"),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              color: AppColor
                                  .grey, // Set the background color here
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Rail',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'U',
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("ttt"),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              color: AppColor
                                  .grey, // Set the background color here
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Montant',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'U',
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("ddd"),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              color: AppColor
                                  .grey, // Set the background color here
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Cheville à frappe 6/40',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('U'),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                  "rrr"),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              color: AppColor
                                  .grey, // Set the background color here
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Vis TTPC 45',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'U',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child:
                                  Text("ddd"),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              color: AppColor
                                  .grey, // Set the background color here
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Cornière 25',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'U',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child:
                                  Text("qdsd"),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              color: AppColor
                                  .grey, // Set the background color here
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Vis TRPF 9.5',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'U',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child:
                                  Text("se"),
                            ),
                          ),
                        ],
                      ),
                      
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              color: AppColor
                                  .grey, // Set the background color here
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Isolation en laine de roche',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'M²',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                  "dsd"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Devis :".toUpperCase(),
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0, // Set the border width
                    ),
                  ),
                  child: Text(
                    '2500.00 DA',
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CustomButtomAuth(
              text: "Commander",
              onPressed: () {
                MyServices myServices = Get.find();

                if (myServices.sharedPreferences.getString("inscrire_mail") !=
                    null) {
                  Get.offNamed(AppRoute.successSignUp);
                } else {
                  Get.offNamed(AppRoute.signUp);
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
