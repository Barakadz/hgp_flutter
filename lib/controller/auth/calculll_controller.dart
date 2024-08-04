import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  // Abstract class can contain common methods and properties for child controllers
}

class CalculllControllerImp extends VerifyCodeSignUpController {
    var isSwitched = false.obs;
  var largeur = 0.0.obs;
    var hauteur = 0.0.obs;
    var depart = 0.0.obs;

  late TextEditingController largeurController;
    late TextEditingController hauteurController;
    late TextEditingController departController;

  RxString  svgStringg = ''.obs;
  
  @override
  void onInit() {
    super.onInit();
    
    hauteurController = TextEditingController(text: 5.0.toString());
        updateHauteurFromController();

    largeurController = TextEditingController(text: 10.0.toString());
    
    updateLargeurFromController();

  
     departController = TextEditingController(text: 30.0.toString());
    
    updateDepartFromController();
 
         rr();
 add(); // Call the add function directly on initialization
  }

  

  @override
  void onClose() {
        hauteurController.dispose();

    largeurController.dispose();
            departController.dispose();

    super.onClose();
  }
    void updateHauteurFromController() {
    try {
      hauteur.value = double.tryParse(hauteurController.text) ?? 0.0;
      print("Updated largeur: ${hauteur.value}");
    } catch (e) {
      print("Error parsing largeur: $e");
    }
  }
    void updateLargeurFromController() {
    try {
      largeur.value = double.tryParse(largeurController.text) ?? 0.0;
      print("Updated largeur: ${largeur.value}");
    } catch (e) {
      print("Error parsing largeur: $e");
    }
  }
   void updateDepartFromController() {
    try {
      depart.value = double.tryParse(departController.text) ?? 0.0;
      print("Updated largeur: ${depart.value}");
    } catch (e) {
      print("Error parsing largeur: $e");
    }
  }
 // Method to return the SVG string
  String getSvgString() {
    return svgStringg.value;
  }
  // Method to update the SVG string
  void updateSvgString(String newSvgContent) {
    svgStringg.value = newSvgContent;
  }
    // Method to convert the text input to a double and assign to largeur
   

void rr(){
  




bool estPair(double nombre) {
  return nombre % 2 == 0;
}
bool estPairr(int nombre) {
  return nombre % 2 == 0;
}

bool isInteger(num value) {
  return value is int || value == value.toInt();
}
 


   //pour stocker les chuttes:
//il faut créer 04 array : chaque array réprésente un information
//array type vide
   List<String> type = [];
//array position vide
   List<String> position = [];
//array largeur vide
   List<double> largeur_chutte = [];
//array hauteur vide 
   List<double> hauteur_chute = [];
 
  
 print("montant debart ==> ${depart.value}");

    double opo = largeur.value / 1.2;
  double opoo = hauteur.value / 0.6;
int nbrplaquesansdecoupe_hauteur=opoo.toInt();


int nbrplaquesansdecoupe=opo.toInt();
int nbrplaquesansdecoupe_rgb=0;


String position_repition='';
double hhs=0;
int rep_rga=0;
int rep_rgb=0;
  double departt=0;

int oo=0;


print("nombre de plaque dans RGA sans découpe ==> $nbrplaquesansdecoupe");
  //etape 01==> tester si (largeur/1.2) est une resultats integer or double
  //calcul les chuttes TOP:
     rep_rga=((hauteur.value/0.6)/2).round();//ceil==> arrondi nombre
  print("la répitition du RGA :$rep_rga");
 int nombre_total_plaque_rga_sansdecoupe= nbrplaquesansdecoupe*rep_rga;
 print("nombre total des plaques sans decoupe du RGA :$nombre_total_plaque_rga_sansdecoupe");
 if(estPair(opoo)==true){
 rep_rgb=((hauteur.value/0.6)/2).ceil(); //ceil==> arrondi suppérieur
 }else{
  rep_rgb=((hauteur.value/0.6)/2).floor();//floor ==> arrondi inférieur
 }
  print("la répitition du RGB: $rep_rgb");

if(isInteger(opoo)==true){
print("pas du chutte top");
}else{
print("il existe un chutte ");
if(rep_rga==rep_rgb){
  position_repition="RGA";
print("les chuttes top dans la position==>  $position_repition");
}else{
    position_repition="RGB";
print("les chuttes top dans la position==>  $position_repition");
}
}
if(isInteger(opo)==true){
  print("n'existe pas les plaques decoupé dans RGA");
  //RGA
print("Dans RGA n'existe pas les chuttes");
  //RGB
  print("il existe deux plaque découpé dans RGB");
print("Dans RGB il existe deux chutte , les deux du largeur 0.6 ");

}else{

  double largeur_plaque_decoupe_rgb;

print("il existe une seul plaque decoupé");
// largeur d'un plaque decoupé pour RGA
double largeur_plaque_decoupe=double.parse((largeur.value-(nbrplaquesansdecoupe*1.2)).toStringAsFixed(1));
print("largeur d'un plaque découpé RGA: $largeur_plaque_decoupe");
double largeur_chutte_rga=double.parse((1.2-largeur_plaque_decoupe).toStringAsFixed(1));
print("la largeur d'un chutte reste RGA : $largeur_chutte_rga");
type.add("Female");
position.add("RGA");
largeur_chutte.add(largeur_chutte_rga);
hauteur_chute.add(0.6);
// largeur d'un plaque decoupé pour RGB (il existe deux , une de largeur 0.6 parce que System HGP commence par 0.6 ans la RGB)
  if(depart.value==30){
    departt=0.6;
    print("--------------");
    print("largeur d'un plaque premiére découpé RGB: $departt");
    print("--------------");
    print("la premiere chute reste dans RGB est d'un largeur $departt");
    largeur_plaque_decoupe_rgb=largeur_plaque_decoupe+0.6;
print(largeur_plaque_decoupe_rgb);
double ss=1.2-departt;
type.add("Female");
position.add("RGB");
largeur_chutte.add(ss);
hauteur_chute.add(0.6);
  }else{
    double dd=depart.value/100;
     depart.value+30;
    
     departt=depart/100;
     print("jdjjjxxxxxxxxxx====>$dd");
    double premier_chutte_reste_rgb= double.parse((1.2-departt).toStringAsFixed(1));
    print("largeur d'un plaque premiére découpé RGB: $departt");
    print("la premiere chute reste dans RGB est d'un largeur $premier_chutte_reste_rgb");  
    largeur_plaque_decoupe_rgb=double.parse((largeur_plaque_decoupe+premier_chutte_reste_rgb).toStringAsFixed(1));
     print(largeur_plaque_decoupe_rgb);
type.add("Female");
position.add("RGB");
largeur_chutte.add(premier_chutte_reste_rgb);
hauteur_chute.add(0.6);

  }
 print("=======");
  nbrplaquesansdecoupe_rgb=nbrplaquesansdecoupe-1;
if(largeur_plaque_decoupe_rgb>=1.2){
    largeur_plaque_decoupe_rgb=((largeur_plaque_decoupe_rgb-1.2 )* 10).ceilToDouble() / 10;
    nbrplaquesansdecoupe_rgb+=1;
}

print("nombre de plaque dans RGB sans découpe ==> $nbrplaquesansdecoupe_rgb");
if(largeur_plaque_decoupe_rgb!=0){
  print("largeur d'un plaque deuxiéme découpé RGB: $largeur_plaque_decoupe_rgb");
  double largeur_chutte_rgb=double.parse((1.2-largeur_plaque_decoupe_rgb).toStringAsFixed(1));
print("la deuxiem chute reste dans RGB d'un largeur $largeur_chutte_rgb");

type.add("Female");
position.add("RGB");
largeur_chutte.add(largeur_chutte_rgb);
hauteur_chute.add(0.6);


}else{
  oo=1;
  print("il existe pas de deuxieme chuttes dans RGB");
}

}
      double width=Get.width+100;
    double height=Get.height;
    double width_svg=width+155;
double width_dessin=width+81;
double height_svg=height-200;
double height_dessein=height_svg-35;
print("height of dessin: $height_dessein");
int pas_x=(width_dessin/opo).round();
int pas_y=(height_dessein/opoo).round();
print("pas y : $pas_y");

 int hauter_des_plaque_sans_decoupe=nbrplaquesansdecoupe_hauteur*pas_y;
  print("hhhh$hauter_des_plaque_sans_decoupe");
double hauteur_plaque_decoupe=(height_dessein-hauter_des_plaque_sans_decoupe).floorToDouble();
print("hauteur plaque decoupe : $hauteur_plaque_decoupe");
print("width design : $width_dessin");
print("pax x:$pas_x");
int largeur_des_plaque_sans_decoupe=nbrplaquesansdecoupe*pas_x;
double largeur_plaque_decoupe_dessin =width_dessin-largeur_des_plaque_sans_decoupe;
 print("largeur d'unplaque decoupe sur dessein : $largeur_plaque_decoupe_dessin");
 double debut_deseign_y_plaque=(height_dessein-pas_y)+28;

    String rectElements = '';
 
 
   
   
    if(isInteger(opo)==true){
    for (int i = 0; i < nbrplaquesansdecoupe; i++) {
      double x = 36 +largeur_plaque_decoupe_dessin+ (pas_x * i); // Calculate x position
      double xx=x+pas_x;
      rectElements += '''
<rect fill="#c1baba" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$pas_x" x="$x" y="$debut_deseign_y_plaque" />
   <!-- Border top: green -->
  <line x1="$x" y1="$debut_deseign_y_plaque" x2="$xx" y2="$debut_deseign_y_plaque" stroke="green" stroke-width="3" />
  <!-- Border left: green -->
  <line x1="$x" y1="$debut_deseign_y_plaque" x2="$x" y2="452.99999" stroke="green" stroke-width="3" />
'''; 


//deseign les chuttes top RGA:
if(position_repition=='RGA'){
      rectElements += '''
<rect fill="#c1baba" height="$hauteur_plaque_decoupe" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$pas_x" x="$x" y="28" />
''';
}




 for (int j = 1; j < nbrplaquesansdecoupe_hauteur; j++) {
        double y = debut_deseign_y_plaque - (pas_y * j); // Calculate x position
 if(estPairr(j)==true){
  //boucle RGA
        rectElements += '''
<rect fill="#c1baba" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$pas_x" x="$x" y="$y" />
''';
 }else{
 //boucle RGB
if(i!=nbrplaquesansdecoupe-1){
  double x_debt=x+(pas_x/2);
rectElements +='''
  <!-- RGB -->
<rect fill="#c1baba" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$pas_x" x="$x_debt" y="$y" />
''';

//deseign les chuttes top RGB:
if(position_repition=='RGB'){
      rectElements += '''
<rect fill="#c1baba" height="$hauteur_plaque_decoupe" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$pas_x" x="$x_debt" y="28" />
''';
}
}else{
    double x_debt=x+(pas_x/2);
     double width_6=pas_x/2;
rectElements +='''
  <!-- RGB  deseign du plaque decoupe 0.6 -->
<rect fill="#c1baba" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_6" x="$x_debt" y="$y" />
''';
//deseign plaque decoupe 0.6 top RGB:
if(position_repition=='RGB'){
      rectElements += '''
<rect fill="#c1baba" height="$hauteur_plaque_decoupe" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_6" x="$x_debt" y="28" />
''';
}

}
     double width_6=pas_x/2;
double x_debt=100;
        double x_plaque_decoupe =41;// Calculate x position
double width_rgb_decoupe=largeur_plaque_decoupe_dessin+width_6;
rectElements +='''
  <!-- RGB  deseign du deuxiem plaque decoupe  -->
<rect fill="#c1baba" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_rgb_decoupe" x="$x_plaque_decoupe" y="$y" />
''';


//deseign du deuxiem plaque decoupe top RGB:
if(position_repition=='RGB'){
      rectElements += '''
<rect fill="#c1baba" height="$hauteur_plaque_decoupe" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_rgb_decoupe" x="$x_plaque_decoupe" y="28" />
''';
}
 }
}
    }
    }else{
  for (int i = 0; i < nbrplaquesansdecoupe+1; i++) {
      double x = 35 +largeur_plaque_decoupe_dessin+ (pas_x * i); // Calculate x position
      double xx=x+pas_x;
     //deseein d'un plaque decoupé RGA:
if(i==nbrplaquesansdecoupe){
        double x_plaque_decoupe =41;// Calculate x position
 rectElements += '''
<rect fill="yellow" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$largeur_plaque_decoupe_dessin" x="$x_plaque_decoupe" y="$debut_deseign_y_plaque" />
 ''';





  for (int j = 1; j < nbrplaquesansdecoupe_hauteur; j++) {
        double y = debut_deseign_y_plaque - (pas_y * j); // Calculate x position

 if(estPairr(j)==true){
  double ui=y+30;
//deseign les chutte RGA boucle: 
        rectElements += '''
<rect fill="yellow" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$largeur_plaque_decoupe_dessin" x="$x_plaque_decoupe" y="$y" />
  ''';
//deseign les chuttes min top RGA:
if(position_repition=='RGA'){
      rectElements += '''
<rect fill="yellow" height="$hauteur_plaque_decoupe" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$largeur_plaque_decoupe_dessin" x="$x_plaque_decoupe" y="28" />
 ''';
}

 }
}

}else{
 rectElements += '''
<rect fill="#c1baba" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$pas_x" x="$x" y="$debut_deseign_y_plaque" />
   <!-- Border top: green 
  <line x1="$x" y1="$debut_deseign_y_plaque" x2="$xx" y2="$debut_deseign_y_plaque" stroke="green" stroke-width="3" />
-->
  <!-- Border left: green 
  <line x1="$x" y1="$debut_deseign_y_plaque" x2="$x" y2="452.99999" stroke="green" stroke-width="3" />
  -->
'''; 

  double zz=debut_deseign_y_plaque-pas_y;


if(i!=nbrplaquesansdecoupe-1){
  double x_debt=x+(pas_x/2);
rectElements +='''

  <!-- RGB -->
<rect fill="#c1baba" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$pas_x" x="$x_debt" y="$zz" />

''';


}else{
/*    double x_debt=x+(pas_x/2);
     double width_6=pas_x/2;
rectElements +='''

  <!-- RGB  deseign du plaque decoupe 0.6 -->
<rect fill="green" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_6" x="$x_debt" y="$zz" />

''';*/
}

     double width_6=pas_x/2;
double x_debt=100;
        double x_plaque_decoupe =41;// Calculate x position
double width_rgb_decoupe=largeur_plaque_decoupe_dessin+width_6;
 
 


 for (int j = 1; j < nbrplaquesansdecoupe_hauteur; j++) {
        double y = debut_deseign_y_plaque - (pas_y * j); // Calculate x position

 if(estPairr(j)==true){
  //boucle RGA
        rectElements += '''
<rect fill="#c1baba" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$pas_x" x="$x" y="$y" />


''';
//deseign les chuttes top RGA:
if(position_repition=='RGA'){
      rectElements += '''
<rect fill="yellow" height="$hauteur_plaque_decoupe" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$pas_x" x="$x" y="28" />
''';
}
 }else{
    //boucle RGB
    int nombre_boucle;
if(nbrplaquesansdecoupe_rgb==nbrplaquesansdecoupe){
nombre_boucle= nbrplaquesansdecoupe;
}else{
  nombre_boucle= nbrplaquesansdecoupe-1;

}


  if(i!=nombre_boucle){
   //
    double x_debt;
     double width_6=pas_x/2;
  x_debt=100;
        double x_plaque_decoupe =41;// Calculate x position
double width_rgb_decoupe=largeur_plaque_decoupe_dessin+width_6;
if(nbrplaquesansdecoupe_rgb==nbrplaquesansdecoupe){
width_rgb_decoupe=width_rgb_decoupe-pas_x;
}
    int m=0;
if(nbrplaquesansdecoupe_rgb==nbrplaquesansdecoupe){
    x_debt=(x+(pas_x/2))-pas_x;
    double x_debut_decoupe_width_6;
        if(m==0){
 
       double width_6=pas_x/2;
       //print("width rgb decoupe===>$width_rgb_decoupe");
     x_debut_decoupe_width_6=(pas_x*nbrplaquesansdecoupe_rgb) + width_rgb_decoupe+35;


double pp=(departt*100)/1.2;
//print("pp==========>$pp");
  hhs=(pp*pas_x)/100;
//print("width of plaque decoupe RGB ==> $hhs");
  rectElements +='''
  <!-- RGB  deseign du plaque decoupe 0.6 -->
<rect fill="yellow" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$hhs" x="$x_debut_decoupe_width_6" y="$y" />
''';
if(position_repition=='RGB'){
      rectElements += '''
<rect fill="#c1baba" height="$hauteur_plaque_decoupe" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_6" x="$x_debut_decoupe_width_6" y="28" />
 ''';
}
          m++;
        }
}else{
    x_debt=x+(pas_x/2);

}
x_debt=x_debt+1;
rectElements +='''

  <!-- RGB -->
<rect fill="#c1baba" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$pas_x" x="$x_debt" y="$y" />

''';

//deseign les chuttes min TOP RGB:
if(position_repition=='RGB'){
      rectElements += '''
<rect fill="yellow" height="$hauteur_plaque_decoupe" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$pas_x" x="$x_debt" y="28" />
 ''';
}
}else{
    double x_debt=x+(pas_x/2);
      double width_6=pas_x/2;
     // print ("x debut ===>$x_debt");
rectElements +='''

  <!-- RGB  deseign du plaque decoupe 0.6 -->
<rect fill="yellow" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_6" x="$x_debt" y="$y" />

''';
//deseign les chuttes min TOP RGB  deseign du plaque decoupe 0.6 : 
if(position_repition=='RGB'){
      rectElements += '''
<rect fill="yellow" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_6" x="$x_debt" y="28" />
 ''';
}

}
    x_debt=100;
        double x_plaque_decoupe =41;// Calculate x position
double width_rgb_decoupe=largeur_plaque_decoupe_dessin+width_6;
if(nbrplaquesansdecoupe_rgb==nbrplaquesansdecoupe){
width_rgb_decoupe=width_rgb_decoupe-pas_x;
} 

  //RGB  deseign du deuxiem plaque decoupe
 if(oo!=1){
   rectElements +='''
 <rect fill="#c1baba" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="2" transform="matrix(1 0 0 1 0 0)" width="$width_rgb_decoupe" x="$x_plaque_decoupe" y="$y" />

''';
 }
 
 
//Deseign min chute TOP dexiem chutte RGB:
if(position_repition=='RGB'){
      rectElements += '''
<rect fill="yellow" height="$hauteur_plaque_decoupe" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_rgb_decoupe" x="$x_plaque_decoupe" y="28" />
 ''';
}

 }
}}}

    }
  int nombre_total_plaque_rgb_sansdecoupe= nbrplaquesansdecoupe_rgb*rep_rgb;
 print("nombre total des plaques sans decoupe du RGB :$nombre_total_plaque_rgb_sansdecoupe");
int nombre_plaque_sansdecoupe=nombre_total_plaque_rga_sansdecoupe+nombre_total_plaque_rgb_sansdecoupe;
    /*  for (int j = 0; j < uu; j++) {
        double y = 35 + (rrr * j); // Calculate x position
        rectElements += '''
 <rect fill="#ffffff" height="$rrr" id="svg_9" stroke="#000000" width="$rr" x="$x" y="$y">
                 </rect>
''';
      }
    } */
  

print(width);
print("heighr of screen :$height");

print("type array ==> $type");
print("position array==>$position");
print("largeur array==>$largeur_chutte");
print("hauteur array ==>$hauteur_chute");

//http://mytransview.grupopuma-dz.com/accounts/login/?next=/
double position_text=width_dessin/2;
double position_arrow=(width_dessin/2)-75;

double montant_debut_x=width_svg-38;
   
   





    String svgContent =
        ''' 
 <svg width="$width_svg" height="$height_svg" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
 <!-- Created with SVG-edit - https://github.com/SVG-Edit/svgedit-->

 <g class="layer">
  <title>Layer 1</title>
  
  
  <rect fill="#ffffff" height="$height_dessein" id="svg_1" stroke="#0000bf" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_dessin" x="38" y="30"/>
  <path d="m$position_arrow,13.8455l7.24795,-7.24798l0,3.62398l10.50417,0l0,-3.62398l7.24794,7.24798l-7.24794,7.24794l0,-3.62397l-10.50417,0l0,3.62397l-7.24795,-7.24794z" fill="#ffffff" id="svg_4" stroke="#000000" stroke-width="2" transform="matrix(1 0 0 1 0 0)"/>
  <path d="m4.92902,212.8455l7.24795,-7.24798l0,3.62398l10.50417,0l0,-3.62398l7.24794,7.24798l-7.24794,7.24794l0,-3.62397l-10.50417,0l0,3.62397l-7.24795,-7.24794z" fill="#ffffff" id="svg_6" stroke="#000000" stroke-width="2" transform="matrix(1 0 0 1 0 0) rotate(-90.4604 17.4291 212.845)"/>
  <text fill="#000000" font-family="Serif" font-size="24" id="svg_14" stroke="#000000" stroke-width="0" text-anchor="middle" x="364.19998" xml:space="preserve" y="317.99999"/>
  <text fill="#000000" font-family="Serif" font-size="24" id="svg_18" stroke="#ff0000" stroke-width="0" text-anchor="middle" x="$position_text" xml:space="preserve" y="19">LC= ${largeur.value}  </text>
  <text fill="#000000" font-family="Serif" font-size="24" id="svg_19" stroke="#ff0000" stroke-width="0" text-anchor="middle" transform="rotate(-90 18.2 267)" x="18.19999" xml:space="preserve" y="274.99999">HC= ${hauteur.value}  </text>

 
 $rectElements
  
  <!-- Draw a circle -->
  <circle cx="18" cy="480" r="15" stroke="black" stroke-width="3" fill="blue" />
  
  <!-- Place text "1" in the center of the circle -->
  <text x="18" y="488" font-family="Arial" font-size="22" fill="white" text-anchor="middle" dominant-baseline="middle">1</text>

  <!-- Draw a circle -->
  <circle cx="${width_svg-17}" cy="440" r="15" stroke="black" stroke-width="3" fill="blue" />
  
  <!-- Place text "1" in the center of the circle -->
  <text x="${width_svg-17}" y="450" font-family="Arial" font-size="22" fill="white" text-anchor="middle" dominant-baseline="middle">1</text>

 
 </g>
</svg>




 ''';
 // Update the SVG string
    updateSvgString(svgContent);
}

  // Method to generate the rectElementsMontant
  String addMontant() {
    String rectElementsMontant = '';
    double width = Get.width + 100;
    double height = Get.height;
    double width_svg = width + 155;
    double height_svg = height - 200;
    double montant_debut_x = width_svg - 38;

    for (int i = 0; i < 23; i++) {
      rectElementsMontant += '''
      <line x1="$montant_debut_x" y1="26" x2="$montant_debut_x" y2="$height_svg" id="montant" style="stroke:blue;stroke-width:2;stroke-dasharray:5,5" />
      ''';
      montant_debut_x -= 30;
    }
    return rectElementsMontant;
  }
void removeMontantFromSVG() {
  String existingSvg = getSvgString();

  // Regular expression to match <line> elements with id="montant"
  String updatedSvg = existingSvg.replaceAll(RegExp(r'<line[^>]*id="montant"[^>]*?/>'), '');

  // Update the SVG string
  updateSvgString(updatedSvg);
}

  // Method to add montant lines to SVG
  void addMontantToSVG() {
    String newRectElementsMontant = addMontant();

    String existingSvg = getSvgString();
    // Check if the existing SVG is not empty
    if (existingSvg.isNotEmpty) {
        // Find the position of the closing </g> tag
      int insertPosition = existingSvg.indexOf('</g>');

      // If </g> tag is found
      if (insertPosition != -1) {
        String updatedSvg = existingSvg.replaceRange(insertPosition, insertPosition, newRectElementsMontant + '\n');
        updateSvgString(updatedSvg);
      } else {
        // If </g> tag is not found, you can decide how to handle it (e.g., append to the end)
        String updatedSvg = existingSvg + '\n' + newRectElementsMontant; // Append to the end
        updateSvgString(updatedSvg);
      }
    } else {
      // If no existing SVG, create a new one with the new elements
      String initialSvg = '''
      <svg xmlns="http://www.w3.org/2000/svg">
        $newRectElementsMontant
      </svg>
      ''';
      updateSvgString(initialSvg);
    }
  }


   double h = 4;
  var l = 0.0.obs;

   
  double d = 10;
  var selectedValueTypeMontant = 'M35/48'.obs;

  void setSelctedTypeMontant(String value) {
    selectedValueTypeMontant.value = value;
  }
  final List<List<String>> data = [
    ["Montant", "Entraxe 60 cm", "Entraxe 60 cm", "Entraxe 40 cm", "Entraxe 40 cm", "Entraxe 30 cm", "Entraxe 30 cm"],
    ["", "Montant simple", "Montant double", "Montant simple", "Montant double", "Montant simple", "Montant double"],
    ["M35/48", "3", "3.57", "3.32", "3.95", "3.57", "4.24"],
    ["M40/70", "3.82", "4.55", "4.23", "5.03", "4.55", "5.41"],
    ["M40/90", "4.42", "5.25", "4.89", "5.81", "5.25", "6.25"]
  ];

  var dropdownItems = <String>[
    'choissir la configuration'
  
  ].obs;
  var EntaxeItem = <String>[
    '30 cm',
    '40 cm',
    '60 cm'
  
  ].obs;
   var selectedConfigurationMontant = 'choissir la configuration'.obs;
      var selectedEntraxe = '30 cm'.obs;

  var errorText = ''.obs;
 
    double get largeurValue => largeur.value;

  void add() {
    
    if(hauteur.value<=6.25){ 
      for (int i = 2; i < 5; i++) {
      for (int j = 1; j < 7; j++) {
       
           if (h <= double.parse(data[i][j])) {
          dropdownItems.add('${data[1][j]} | ${data[0][j]} | H Limite ${double.parse(data[i][j])}');
         }
       
       
      }
    } }else{
                    dropdownItems.add('${data[1][6]} | ${data[0][6]} | H Limite ${double.parse(data[4][6])}');

        }
    print(dropdownItems);
   }

  void setSelectedConfigurationMontant(String value) {
    selectedConfigurationMontant.value = value;
  }
    void setSelectedEntraxe(String value) {
    selectedEntraxe.value = value;
    print("Entraxe=====>$selectedEntraxe");

  }

  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }

  String? validateInputt(String val, int min, int max, String type) {
    if (val.isEmpty) {
      return "Le champ $type ne peut pas être vide.";
    } else if (double.parse(val) > 60) {
      return "La valeur maximale est 60 cm.";
    } else if (double.parse(val) < 10) {
      return "La valeur minimale est 10 cm.";
    }
    return null;
  }

  void onChanged(String val, int min, int max, String type) {
    var validationMessage = validateInputt(val, min, max, type);
    errorText.value = validationMessage ?? '';
  }
}
