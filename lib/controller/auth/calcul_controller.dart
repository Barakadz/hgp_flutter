import 'package:dartz/dartz.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/view/widget/custom_snackbar.dart';
import 'package:http/http.dart';
import 'package:hgp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity/connectivity.dart';

//kol page lazem ykon laha controller page login 3andha controller , page signup 3andeha controller ...
abstract class LoginController extends GetxController {
  signUp();
  //tedini signup page
  goToSignUp();
  calculSurface();
  GoToCalcul() {}
}

findNearest(List<double> list, double target) {
  double minDiff = double.infinity;
  double nearestValue = 0.0;
  int nearestIndex = -1;

  for (int i = 0; i < list.length; i++) {
    double diff = (list[i] - target).abs();
    if (diff < minDiff || (diff == minDiff && list[i] < nearestValue)) {
      minDiff = diff;
      nearestValue = list[i];
      nearestIndex = i;
    }
  }

  return nearestValue;
}

//lazem na7e9eneha fel page login
class CalculControllerImp extends LoginController {

 RxList<TextEditingController> hauteurControllers = <TextEditingController>[].obs;
  RxList<TextEditingController> largeurControllers = <TextEditingController>[].obs;

  void initializeControllers(int numberOfControllers) {
    hauteurControllers.clear();
    largeurControllers.clear();
    for (int i = 0; i < numberOfControllers; i++) {
      hauteurControllers.add(TextEditingController());
      largeurControllers.add(TextEditingController());
    }
  }











 var uniteLargeurCloisson = 'm'.obs;
   void setSelectedUniteLargeurCloisson(String value) {
    uniteLargeurCloisson.value = value;
  }


 var uniteHauteurCloisson = 'm'.obs;
   void setSelectedUniteHauteurCloisson(String value) {
    uniteHauteurCloisson.value = value;
  }

 
  var uniteLargeurSimailairePorte = 'm'.obs;
   void setSelectedUniteLargeurSimailairePorte(String value) {
    uniteLargeurSimailairePorte.value = value;
  }


 var uniteHauteurSimailairePorte = 'm'.obs;
   void setSelectedUniteHauteurPorte(String value) {
    uniteHauteurSimailairePorte.value = value;
  }



 var selectedTypeMur = 'mur plein'.obs;
  void setSelectedTypeMur(String value) {
    selectedTypeMur.value = value;
  }



 var selectedSimilaire = ''.obs; // Initial selected value is an empty string
 var selectedValue = ''.obs; // Initial selected value is an empty string

 

  var isLoading = false.obs;
  var checked_bande = false.obs;
  var cheked_lande = false.obs;

  var selectedValueTypeCloison = 'cloison (double parments)'.obs;
  void setSelectedValueTypeCloison(String value) {
    selectedValueTypeCloison.value = value;
  }



  var selectedOption = 'mur plein'.obs;
  //key linfewetoha lel form
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController hauteur;
  late TextEditingController hauteur_porte;
  late TextEditingController hauteur_portee;
  late TextEditingController hauteur_fenetre;
  late TextEditingController hauteur_fenetree;

  late TextEditingController largeur;
  late TextEditingController largeur_porte;
  late TextEditingController largeur_portee;
  late TextEditingController largeur_fenetre;
  late TextEditingController largeur_fenetree;

  late TextEditingController hauteur_objet;
  late TextEditingController largeur_objet;
  late TextEditingController surface;

  late TextEditingController nombre_porte;

  late TextEditingController largeur_porte_similaire;
  late TextEditingController hauteur_porte_similaire;









  double findNearest(List<double> list, double target) {
    double minDiff = double.infinity;
    double nearestValue = 0.0;

    for (int i = 0; i < list.length; i++) {
      double diff = (list[i] - target).abs();
      if (diff < minDiff) {
        minDiff = diff;
        nearestValue = list[i];
      }
    }

    return nearestValue;
  }

  List<dynamic> findClosestValueAbove(List<double> list, double target) {
    double closestAbove = double.infinity;
    int index = -1;

    for (int i = 0; i < list.length; i++) {
      double value = list[i];
      if (value > target && value < closestAbove) {
        closestAbove = value;
        index = i;
      }
    }

    if (index != -1) {
      return [closestAbove, index];
    } else {
      return [null, -1];
    }
  }

  @override
  GoToCalcul() {
      //form
      var largeur_cloison=largeur.text;
      var hauteur_cloison=hauteur.text;
      var nbr_porte=nombre_porte.text;

      var largeur_port_s=largeur_porte_similaire.text;
      var hauteur_porte_s=hauteur_porte_similaire.text;

    var formdata = formstate.currentState;
    if (formdata!.validate()) {
  print("selected simailaire :$selectedSimilaire");
  print("Type de cloison  :$selectedValueTypeCloison");
  print("largeur du cloisson :$largeur_cloison");
  print("hauteur du cloisson :$hauteur_cloison");
  print("Unité du largeur de cloison $uniteLargeurCloisson");   
  print("Unité du hauteur de cloison $uniteHauteurCloisson");   
  print("Nombre du porte $nbr_porte");   
  print("Type of the mur : $selectedTypeMur");
  print("Largeur porte simailaire : $largeur_port_s");
  print("Hauteur porte simailaire : $hauteur_porte_s");
  print("Unite largeur porte simailaire : $uniteLargeurSimailairePorte");
  print("Unite hauteur porte simailaire : $uniteHauteurSimailairePorte");

if(selectedValueTypeCloison=='cloison (double parments)'){
  Get.offNamed(AppRoute.shema ,arguments: {
    "largeur":largeur.text
  });
}

for (int i = 0; i < int.parse(nbr_porte); i++) {
                print('Hauteur ${i}: ${hauteurControllers[i].text}');
                print('Largeur ${i}: ${largeurControllers[i].text}');
              }



       } else {
      print("not valid");
    }
   // Get.offNamed(AppRoute.calcull);


 
  }

  @override
  signUp() {
    //form
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      //
      //delete les données men memory , prcq lema derna signup wenkmlo wenro7o page login , kin3awdo nwelo signup yego3do les données 3la biha derte delete lel memory bach les données yror7o
      // 7dadena beli SignUpControllerImp howa lindirolah delete lel memory
      Get.delete<CalculControllerImp>();
      //awe testa3mle lazyput
    } else {
      print("not valid");
    }
  }

  @override
  goToSignIn(
      double hauteurr,
      double longuer,
      double largeurPorte,
      double hauteurPorte,
      double largeurFenetre,
      double hauteurFenetre,
      double largeurPortee,
      double hauteurPortee,
      double largeurFenetree,
      double hauteurFenetree) {
    var formdata = formstate.currentState;

    List<double> nearstvalues = [];
    List<double> closestvaluesabove = [];
    List<double> montant = [100, 3, 3.57, 3.32, 3.95, 3.57, 4.24];
    List<double> montantt = [120, 3.82, 4.55, 4.23, 5.03, 4.55, 5.41];
    List<double> montanttt = [140, 4.42, 5.25, 4.89, 5.81, 5.25, 6.25];

    double nearest = findNearest(montantt, hauteurr);

    print('Nearest value to $hauteur:$nearest');
    print(nearstvalues);
    List<dynamic> resultt = findClosestValueAbove(montant, hauteurr);
    double closestValueAbove = resultt[0];
    int positionn = resultt[1];
    closestvaluesabove.add(closestValueAbove);

    List<dynamic> resultt_ = findClosestValueAbove(montantt, hauteurr);
    double closestValueAbove_ = resultt_[0];
    int positionn_ = resultt_[1];
    closestvaluesabove.add(closestValueAbove_);

    List<dynamic> resultt__ = findClosestValueAbove(montanttt, hauteurr);
    double closestValueAbove__ = resultt__[0];
    int positionn__ = resultt__[1];
    closestvaluesabove.add(closestValueAbove__);
    double min22 = closestvaluesabove[0];
    for (int i = 1; i < closestvaluesabove.length; i++) {
      if (closestvaluesabove[i] < min22) {
        min22 = closestvaluesabove[i];
      }
    }
    print("Maximum $min22");

    if (formdata!.validate()) {
      print(selectedOption);

// nombre de plaque
//mur plein:
      var surfaceMur = (hauteurr * longuer);
      var surfacePlaque = 0.72;
      var nbrPlaqueMurPleinContreCloison = (surfaceMur / surfacePlaque).ceil();
      var nbrPlaqueMurPleinCloison = nbrPlaqueMurPleinContreCloison * 2;
      var ff = (longuer / 1.2).floor();
      var uu = (hauteurr / 0.6).floor();
      var nbrplaquesansdecoupeContrcloison = ff * uu;
      var nbrpaquedecoupeContrecloison =
          nbrPlaqueMurPleinContreCloison - nbrplaquesansdecoupeContrcloison;

      var nbrplaquesansdecoupecloion = nbrplaquesansdecoupeContrcloison * 2;
      var nbrplaquedecoupecloison = nbrpaquedecoupeContrecloison * 2;

      var collecolpamurplein = surfaceMur;
      var lainemeneralemurplein = collecolpamurplein;

//mur avec porte
      var surfacePorte = (largeurPorte * hauteurPorte);
      var surfaceRestant = surfaceMur - surfacePorte;
      var nbrplaquePorteContreCloison = (surfaceRestant / surfacePlaque).ceil();
      var nbrPlaquePorteCloison = nbrplaquePorteContreCloison * 2;

      var collecolpamurporte = surfaceRestant;
      var lainemeneralemurporte = collecolpamurporte;
//mur avec fenetre
      var surfaceFenetre = (largeurFenetre * hauteurFenetre);
      var surfaceRestantCasFenetre = surfaceMur - surfaceFenetre;
      var nbrplaquefenetreContreCloison =
          (surfaceRestantCasFenetre / surfacePlaque).ceil();
      var nbrPlaqueFenetreCloison = nbrplaquefenetreContreCloison * 2;

      var collecolpamurfenetre = surfaceRestantCasFenetre;
      var lainemeneralefenetre = collecolpamurfenetre;
//mur avec porte et fenetre:
      var surfacePortee = (largeurPortee * hauteurPortee);
      var surfaceFenetree = (largeurFenetree * hauteurFenetree);

      var surfaceNette = surfaceMur - surfacePortee - surfaceFenetree;
      var nbrplaquefenetrePorteContreCloison =
          (surfaceNette / surfacePlaque).ceil();
      var nbrPlaqueFenetrePorteCloison = nbrplaquefenetrePorteContreCloison * 2;

      var colleplatreportefenetre = surfaceNette;
      var lainemeneraleportefenetre = colleplatreportefenetre;

      Get.offNamed(AppRoute.calculll, arguments: {
        "largeur": longuer,
        "hauteur": hauteurr,
        "nbrplaquesansdecoupe": nbrplaquesansdecoupeContrcloison,
        "nbrplaquedecoupe": nbrpaquedecoupeContrecloison,
        "ff": ff,
        "uu": uu,
      });

      /*    if ((checked_bande == true) && (cheked_lande == true) && (  selectedValue == "Cloison"  )) {
          Get.offNamed(AppRoute.calculll, arguments: {
            "Plaque_HTB25": ,
            "colle": ((hauteurr * longuer) / 1).ceil(),
            "rail": (((longuer / 0.6 + 2)).ceil() * 0.3 / 3).ceil() +
                (((longuer) / 3) * 2).ceil(),
            "montant": ((longuer / 0.6 + 2)).ceil(),
            "cheville_frape": (((longuer / 0.6) * 2) + ((2 * 3) / 0.6)).ceil(),
            "vis_ttpc_45":
                ((((hauteurr * longuer) / 0.72).ceil() * 2).ceil() * 8).ceil(),
            "corniere_25": (((longuer) / 3) * 2).ceil(),
            "vis_trpf_95": (((longuer / 0.6 + 2)).ceil() * 4).ceil(),
            "bande_acoustique":
                (longuer * 2) + (((longuer / 0.6 + 2)).ceil() * 3 * 2),
            "laine_minerale": ((hauteurr * longuer)).ceil(),
          });
        } 
   
*/
      /*  if (selectedValue == "Cloison" && hauteurr > 3) {
        if ((checked_bande == true) && (cheked_lande == true)) {
          Get.offNamed(AppRoute.calculll, arguments: {
            "Plaque_HTB25": (((hauteurr * longuer) / 0.72).ceil() * 2).ceil(),
            "colle": ((hauteurr * longuer) / 1).ceil(),
            "rail": (((longuer / 0.6 + 2)).ceil() * 0.3 / 3).ceil() +
                (((longuer) / 3) * 2).ceil(),
            "montant": ((longuer / 0.6 + 2)).ceil(),
            "cheville_frape": (((longuer / 0.6) * 2) + ((2 * 3) / 0.6)).ceil(),
            "vis_ttpc_45":
                ((((hauteurr * longuer) / 0.72).ceil() * 2).ceil() * 8).ceil(),
            "corniere_25": (((longuer) / 3) * 2).ceil(),
            "vis_trpf_95": (((longuer / 0.6 + 2)).ceil() * 4).ceil(),
            "bande_acoustique":
                (longuer * 2) + (((longuer / 0.6 + 2)).ceil() * 3 * 2),
            "laine_minerale": ((hauteurr * longuer)).ceil(),
          });
        } else if (checked_bande == true) {
          Get.offNamed(AppRoute.calculll, arguments: {
            "Plaque_HTB25": (((hauteurr * longuer) / 0.72).ceil() * 2).ceil(),
            "colle": ((hauteurr * longuer) / 1).ceil(),
            "rail": (((longuer / 0.6 + 2)).ceil() * 0.3 / 3).ceil() +
                (((longuer) / 3) * 2).ceil(),
            "montant": ((longuer / 0.6 + 2)).ceil(),
            "cheville_frape": (((longuer / 0.6) * 2) + ((2 * 3) / 0.6)).ceil(),
            "vis_ttpc_45":
                ((((hauteurr * longuer) / 0.72).ceil() * 2).ceil() * 8).ceil(),
            "corniere_25": (((longuer) / 3) * 2).ceil(),
            "vis_trpf_95": (((longuer / 0.6 + 2)).ceil() * 4).ceil(),
            "bande_acoustique":
                (longuer * 2) + (((longuer / 0.6 + 2)).ceil() * 3 * 2),
          });
        } else if (cheked_lande == true) {
          Get.offNamed(AppRoute.calculll, arguments: {
            "Plaque_HTB25": (((hauteurr * longuer) / 0.72).ceil() * 2).ceil(),
            "colle": ((hauteurr * longuer) / 1).ceil(),
            "rail": (((longuer / 0.6 + 2)).ceil() * 0.3 / 3).ceil() +
                (((longuer) / 3) * 2).ceil(),
            "montant": ((longuer / 0.6 + 2)).ceil(),
            "cheville_frape": (((longuer / 0.6) * 2) + ((2 * 3) / 0.6)).ceil(),
            "vis_ttpc_45":
                ((((hauteurr * longuer) / 0.72).ceil() * 2).ceil() * 8).ceil(),
            "corniere_25": (((longuer) / 3) * 2).ceil(),
            "vis_trpf_95": (((longuer / 0.6 + 2)).ceil() * 4).ceil(),
            "laine_minerale": ((hauteurr * longuer)).ceil(),
          });
        } else {
          Get.offNamed(AppRoute.calculll, arguments: {
            "Plaque_HTB25": (((hauteurr * longuer) / 0.72).ceil() * 2).ceil(),
            "colle": ((hauteurr * longuer) / 1).ceil(),
            "rail": (((longuer / 0.6 + 2)).ceil() * 0.3 / 3).ceil() +
                (((longuer) / 3) * 2).ceil(),
            "montant": ((longuer / 0.6 + 2)).ceil(),
            "cheville_frape": (((longuer / 0.6) * 2) + ((2 * 3) / 0.6)).ceil(),
            "vis_ttpc_45":
                ((((hauteurr * longuer) / 0.72).ceil() * 2).ceil() * 8).ceil(),
            "corniere_25": (((longuer) / 3) * 2).ceil(),
            "vis_trpf_95": (((longuer / 0.6 + 2)).ceil() * 4).ceil(),
          });
        }
      } else if (selectedValue == "Cloison" && hauteurr <= 3) {
        if ((checked_bande == true) && (cheked_lande == true)) {
          Get.offNamed(AppRoute.calculll, arguments: {
            "Plaque_HTB25": (((hauteurr * longuer) / 0.72).ceil() * 2).ceil(),
            "colle": ((((hauteurr * longuer) / 1).ceil()) / 2).ceil(),
            "rail": (((longuer) / 3) * 2).ceil(),
            "montant": ((longuer / 0.6 + 2)).ceil(),
            "cheville_frape": (((longuer / 0.6) * 2) + ((2 * 3) / 0.6)).ceil(),
            "vis_ttpc_45":
                ((((hauteurr * longuer) / 0.72).ceil() * 2).ceil() * 8).ceil(),
            "corniere_25": (((longuer) / 3) * 2).ceil(),
            "vis_trpf_95": (((longuer / 0.6 + 2)).ceil() * 4).ceil(),
            "bande_acoustique":
                (longuer * 2) + (((longuer / 0.6 + 2)).ceil() * 3 * 2),
            "laine_minerale": ((hauteurr * longuer)).ceil(),
          });
        } else if (checked_bande == true) {
          Get.offNamed(AppRoute.calculll, arguments: {
            "Plaque_HTB25": (((hauteurr * longuer) / 0.72).ceil() * 2).ceil(),
            "colle": ((((hauteurr * longuer) / 1).ceil()) / 2).ceil(),
            "rail": (((longuer) / 3) * 2).ceil(),
            "montant": ((longuer / 0.6 + 2)).ceil(),
            "cheville_frape": (((longuer / 0.6) * 2) + ((2 * 3) / 0.6)).ceil(),
            "vis_ttpc_45":
                ((((hauteurr * longuer) / 0.72).ceil() * 2).ceil() * 8).ceil(),
            "corniere_25": (((longuer) / 3) * 2).ceil(),
            "vis_trpf_95": (((longuer / 0.6 + 2)).ceil() * 4).ceil(),
            "bande_acoustique":
                (longuer * 2) + (((longuer / 0.6 + 2)).ceil() * 3 * 2),
          });
        } else if (cheked_lande == true) {
          Get.offNamed(AppRoute.calculll, arguments: {
            "Plaque_HTB25": (((hauteurr * longuer) / 0.72).ceil() * 2).ceil(),
            "colle": ((((hauteurr * longuer) / 1).ceil()) / 2).ceil(),
            "rail": (((longuer) / 3) * 2).ceil(),
            "montant": ((longuer / 0.6 + 2)).ceil(),
            "cheville_frape": (((longuer / 0.6) * 2) + ((2 * 3) / 0.6)).ceil(),
            "vis_ttpc_45":
                ((((hauteurr * longuer) / 0.72).ceil() * 2).ceil() * 8).ceil(),
            "corniere_25": (((longuer) / 3) * 2).ceil(),
            "vis_trpf_95": (((longuer / 0.6 + 2)).ceil() * 4).ceil(),
            "laine_minerale": ((hauteurr * longuer)).ceil(),
          });
        } else {
          Get.offNamed(AppRoute.calculll, arguments: {
            "Plaque_HTB25": (((hauteurr * longuer) / 0.72).ceil() * 2).ceil(),
            "colle": ((((hauteurr * longuer) / 1).ceil()) / 2).ceil(),
            "rail": (((longuer) / 3) * 2).ceil(),
            "montant": ((longuer / 0.6 + 2)).ceil(),
            "cheville_frape": (((longuer / 0.6) * 2) + ((2 * 3) / 0.6)).ceil(),
            "vis_ttpc_45":
                ((((hauteurr * longuer) / 0.72).ceil() * 2).ceil() * 8).ceil(),
            "corniere_25": (((longuer) / 3) * 2).ceil(),
            "vis_trpf_95": (((longuer / 0.6 + 2)).ceil() * 4).ceil(),
          });
        }
      } else if (selectedValue == "Contre Cloison" && hauteurr > 3) {
        Get.offNamed(AppRoute.calculll, arguments: {
          "Plaque_HTB25": (((hauteurr * longuer) / 0.72)).ceil(),
          "colle": ((((hauteurr * longuer) / 1).ceil()) / 2).ceil(),
          "rail": ((((longuer / 0.6 + 2)).ceil() * 0.3 / 3).ceil() +
                  (((longuer) / 3) * 2) +
                  ((0.3 * 2) * ((longuer / 0.6 + 2))) / 3)
              .ceil(),
          "montant": ((longuer / 0.6 + 2)).ceil(),
          "cheville_frape": ((((longuer / 0.6) * 2) + ((2 * 3) / 0.6)).ceil()) +
              (4 * ((longuer / 0.6 + 2)).ceil()),
          "vis_ttpc_45":
              (((((hauteurr * longuer) / 0.72).ceil() * 2).ceil() * 8).ceil() /
                      2)
                  .ceil(),
          "corniere_25": (((longuer) / 3)).ceil(),
          "vis_trpf_95": (((longuer / 0.6 + 2)).ceil() * 4).ceil(),
          "bande_acoustique":
              (longuer * 2) + (((longuer / 0.6 + 2)).ceil() * 3),
          "laine_minerale": ((hauteurr * longuer)).ceil(),
        });
      } else if (selectedValue == "Contre Cloison" && hauteurr <= 3) {
        Get.offNamed(AppRoute.calculll, arguments: {
          "Plaque_HTB25": (((hauteurr * longuer) / 0.72)).ceil(),
          "colle": ((hauteurr * longuer) / 1).ceil(),
          "rail": (((longuer) / 3)).ceil(),
          "montant": ((longuer / 0.6 + 2) / 3).ceil(),
          "cheville_frape": (((longuer / 0.6)) + ((2 * 3) / 0.6)).ceil(),
          "vis_ttpc_45":
              (((((hauteurr * longuer) / 0.72).ceil() * 2).ceil() * 8).ceil() /
                      2)
                  .ceil(),
          "corniere_25": (((longuer) / 3)).ceil(),
          "vis_trpf_95": (((longuer / 0.6 + 2)).ceil() * 4).ceil(),
          "bande_acoustique":
              (longuer * 2) + (((longuer / 0.6 + 2)).ceil() * 3),
          "laine_minerale": ((hauteurr * longuer)).ceil(),
        })
      }*/
    }
  }

  @override
  calculSurface() {}

  @override
  void onInit() {
    hauteur = TextEditingController();
    largeur = TextEditingController();
    largeur_porte = TextEditingController();
    hauteur_porte = TextEditingController();
    largeur_portee = TextEditingController();
    hauteur_portee = TextEditingController();

    largeur_fenetre = TextEditingController();
    hauteur_fenetre = TextEditingController();
    largeur_fenetree = TextEditingController();
    hauteur_fenetree = TextEditingController();

    largeur_objet = TextEditingController();
    hauteur_objet = TextEditingController();
    surface = TextEditingController();

    nombre_porte = TextEditingController();
    largeur_porte_similaire = TextEditingController();
    hauteur_porte_similaire = TextEditingController();


    super.onInit();
  }

  @override
  void dispose() {
    hauteur.dispose();
    largeur.dispose();
    surface.dispose();
    nombre_porte.dispose();

    super.dispose();
  }

  @override
  goToSignUp() {
    // TODO: implement goToSignUp
    throw UnimplementedError();
  }

   @override
  void onClose() {
    // Dispose of controllers to avoid memory leaks
    for (var controller in hauteurControllers) {
      controller.dispose();
    }
    for (var controller in largeurControllers) {
      controller.dispose();
    }
    super.onClose();
  }
}
