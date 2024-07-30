 
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
    
 double hauteur=controller.h;
double largeur =controller.l;  
double depart=controller.d;
print("montant debart ==> $depart");
  double opo = largeur / 1.2;
  double opoo = hauteur / 0.6;
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
     rep_rga=((hauteur/0.6)/2).round();//ceil==> arrondi nombre
  print("la répitition du RGA :$rep_rga");
 int nombre_total_plaque_rga_sansdecoupe= nbrplaquesansdecoupe*rep_rga;
 print("nombre total des plaques sans decoupe du RGA :$nombre_total_plaque_rga_sansdecoupe");
 if(estPair(opoo)==true){
 rep_rgb=((hauteur/0.6)/2).ceil(); //ceil==> arrondi suppérieur
 }else{
  rep_rgb=((hauteur/0.6)/2).floor();//floor ==> arrondi inférieur
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
double largeur_plaque_decoupe=double.parse((largeur-(nbrplaquesansdecoupe*1.2)).toStringAsFixed(1));
print("largeur d'un plaque découpé RGA: $largeur_plaque_decoupe");
double largeur_chutte_rga=double.parse((1.2-largeur_plaque_decoupe).toStringAsFixed(1));
print("la largeur d'un chutte reste RGA : $largeur_chutte_rga");
// largeur d'un plaque decoupé pour RGB (il existe deux , une de largeur 0.6 parce que System HGP commence par 0.6 ans la RGB)
  if(depart==30){
    departt=0.6;
    print("largeur d'un plaque premiére découpé RGB: $departt");
    print("la premiere chute reste dans RGB est d'un largeur $departt");
    largeur_plaque_decoupe_rgb=largeur_plaque_decoupe+0.6;
print(largeur_plaque_decoupe_rgb);
  }else{
    depart=depart+30;
     departt=depart/100;
    double premier_chutte_reste_rgb= double.parse((1.2-departt).toStringAsFixed(1));
    print("largeur d'un plaque premiére découpé RGB: $departt");
    print("la premiere chute reste dans RGB est d'un largeur $premier_chutte_reste_rgb");  
    largeur_plaque_decoupe_rgb=double.parse((largeur_plaque_decoupe+premier_chutte_reste_rgb).toStringAsFixed(1));
    print(largeur_plaque_decoupe_rgb);
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
}else{
  oo=1;
  print("il existe pas de deuxieme chuttes dans RGB");
}

}
      double width=Get.width+100;
    double height=Get.height;
    double width_svg=width+140;
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
       print("width rgb decoupe===>$width_rgb_decoupe");
     x_debut_decoupe_width_6=(pas_x*nbrplaquesansdecoupe_rgb) + width_rgb_decoupe+35;


double pp=(departt*100)/1.2;
print("pp==========>$pp");
  hhs=(pp*pas_x)/100;
print("width of plaque decoupe RGB ==> $hhs");
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
<rect fill="#c1baba" height="$hauteur_plaque_decoupe" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$pas_x" x="$x_debt" y="28" />
 ''';
}
}else{
    double x_debt=x+(pas_x/2);
      double width_6=pas_x/2;
      print ("x debut ===>$x_debt");
rectElements +='''

  <!-- RGB  deseign du plaque decoupe 0.6 -->
<rect fill="#c1baba" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_6" x="$x_debt" y="$y" />

''';
//deseign les chuttes min TOP RGB  deseign du plaque decoupe 0.6 :
if(position_repition=='RGB'){
      rectElements += '''
<rect fill="#c1baba" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_6" x="$x_debt" y="28" />
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
 <rect fill="red" height="$pas_y" id="svg_21" stroke="#ff0000" stroke-width="2" transform="matrix(1 0 0 1 0 0)" width="$width_rgb_decoupe" x="$x_plaque_decoupe" y="$y" />

''';
 }
 
 
//Deseign min chute TOP dexiem chutte RGB:
if(position_repition=='RGB'){
      rectElements += '''
<rect fill="#c1baba" height="$hauteur_plaque_decoupe" id="svg_21" stroke="#ff0000" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_rgb_decoupe" x="$x_plaque_decoupe" y="28" />
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
  
//pour stocker les chuttes:
//il faut créer 04 array : chaque array réprésente un information
//array type vide
   List<int> type = [];
//array position vide
   List<int> position = [];
//array largeur vide
   List<int> largeur_chutte = [];
//array hauteur vide 
   List<int> hauteur_chute = [];

print(width);
print("heighr of screen :$height");
double position_text=width_dessin/2;
double position_arrow=(width_dessin/2)-75;

    String svgString =
        ''' 
 <svg width="$width_svg" height="$height_svg" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
 <!-- Created with SVG-edit - https://github.com/SVG-Edit/svgedit-->

 <g class="layer">
  <title>Layer 1</title>
  
  
  <rect fill="#ffffff" height="$height_dessein" id="svg_1" stroke="#0000bf" stroke-width="3" transform="matrix(1 0 0 1 0 0)" width="$width_dessin" x="38" y="30"/>
  <path d="m$position_arrow,13.8455l7.24795,-7.24798l0,3.62398l10.50417,0l0,-3.62398l7.24794,7.24798l-7.24794,7.24794l0,-3.62397l-10.50417,0l0,3.62397l-7.24795,-7.24794z" fill="#ffffff" id="svg_4" stroke="#000000" stroke-width="2" transform="matrix(1 0 0 1 0 0)"/>
  <path d="m4.92902,212.8455l7.24795,-7.24798l0,3.62398l10.50417,0l0,-3.62398l7.24794,7.24798l-7.24794,7.24794l0,-3.62397l-10.50417,0l0,3.62397l-7.24795,-7.24794z" fill="#ffffff" id="svg_6" stroke="#000000" stroke-width="2" transform="matrix(1 0 0 1 0 0) rotate(-90.4604 17.4291 212.845)"/>
  <text fill="#000000" font-family="Serif" font-size="24" id="svg_14" stroke="#000000" stroke-width="0" text-anchor="middle" x="364.19998" xml:space="preserve" y="317.99999"/>
  <text fill="#000000" font-family="Serif" font-size="24" id="svg_18" stroke="#ff0000" stroke-width="0" text-anchor="middle" x="$position_text" xml:space="preserve" y="19">LC= $largeur  </text>
  <text fill="#000000" font-family="Serif" font-size="24" id="svg_19" stroke="#ff0000" stroke-width="0" text-anchor="middle" transform="rotate(-90 18.2 267)" x="18.19999" xml:space="preserve" y="274.99999">HC= $hauteur  </text>

 
 $rectElements




 
 </g>
</svg>




 ''';
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
                                     mycontroller: controller.largeur,
                                      hintText: "Entrer votre largeur",
                                      iconData: FontAwesomeIcons.arrowsAltH,
                                      labelText: "hauteur",
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
                                      mycontroller: controller.hauteur,
                                      hintText: "hauteur_calcul".tr,
                                      iconData: FontAwesomeIcons.arrowsAltV,
                                      labelText: "hauteur",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),




             Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                    SvgPicture.string(
                    svgString,
                    width: Get.width - 150,
                    height: Get.height - 370,
                  ),
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
                        Icon(Icons.arrow_back),
                      Text("Depart montant"),
 Container(
  width: 100,
  height: 70,
     child: CustomTextFormAuth(sufixtext:"cm",
                                        isNumber: true,
                                        valid: (val) {
                                          return validInput(val!, 5, 100, "hauteur");
                                        },
                                        mycontroller: controller.depart,
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
                                 Text("nombre de plaque sans decoupe :$nombre_plaque_sansdecoupe"),
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











//Text(controller.largeur.text),
 

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
