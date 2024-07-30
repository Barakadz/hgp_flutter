import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "email") {
    if (val.isEmpty) {
      return "email_validation1".tr;
    }
    //if not email
    if (!GetUtils.isEmail(val)) {
      return "email_validation2".tr;
    }
  }

  if (type == "largeur_porte") {
    if (val.isEmpty) {
      return "largeur_porte".tr;
    }
  }

  if (type == "hauteur_porte") {
    if (val.isEmpty) {
      return "hauteur_porte".tr;
    }
  }

  if (type == "largeur_fenetre") {
    if (val.isEmpty) {
      return "largeur_fenetre".tr;
    }
  }

  if (type == "hauteur_fenetre") {
    if (val.isEmpty) {
      return "hauteur_fenetre".tr;
    }
  }
  if (type == "hauteur") {
    if (val.isEmpty) {
      return "hauteur1".tr;
    }
    if (double.parse(val) > 6.25) {
      return "hauteur2".tr;
    }
    //if not email
    /*if (!GetUtils.isNumericOnly(val)) {
      return "Hauteur doit étre un nombre";
    }*/
  }
  if (type == "largeur") {
    if (val.isEmpty) {
      return "largeur".tr;
    }
    //if not email
    /*  if (!GetUtils.isNumericOnly(val)) {
      return "Largeur doit étre un nombre";
    }*/
  }
  if (type == "password") {
    if (val.isEmpty) {
      return "password1".tr;
    }
    if (val.length < min) {
      return '${"password2".tr}$min';
    }
  }

  if (type == "nom") {
    if (val.isEmpty) {
      return "nom_validation1".tr;
    }
    if (val.length > max) {
      return '${"nom_validation2".tr}$max';
    }
    if (!GetUtils.isUsername(val)) {
      return "nom_validation3".tr;
    }
  }
  if (type == "prenom") {
    if (val.isEmpty) {
      return "prenom_validation1".tr;
    }
    if (val.length > max) {
      return '${"prenom_validation2".tr}$max';
    }
    if (!GetUtils.isUsername(val)) {
      return "prenom_validation3".tr;
    }
  }

  if (type == "telephone") {
    if (val.isEmpty) {
      return "telephone_val1".tr;
    }
    if (val.length > max) {
      return '${"telephone_val2".tr}$max';
    }
    if (val.length < min) {
      return '${"telephone_val3".tr}$min';
    }
    if (!GetUtils.isPhoneNumber(val)) {
      return "telephone_val4";
    }
  }

  if (type == "adresse") {
    if (val.isEmpty) {
      return "adresse1".tr;
    }

    if (!GetUtils.isUsername(val)) {
      return "adresse2".tr;
    }
  }



   if (type == "nombre_porte") {
    if (val.isEmpty) {
      return "il faut remplir le nombre porte";
    }
    
   
  }
}
