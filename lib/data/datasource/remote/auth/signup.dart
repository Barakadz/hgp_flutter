import 'package:hgp/core/class/crud.dart';
import 'package:hgp/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postData(
      nom, prenom, adresse, nom_entreprise, mail, telephone, password) async {
    var response = await crud.postData(AppLink.signup, {
      "nom": nom,
      "prenom": prenom,
      "adresse": adresse,
      "mail": mail,
      "telephone": telephone,
      "password": password,
      "nom_entreprise": nom_entreprise,
    });
    return response.fold((l) => l, (r) => r);
  }
}
