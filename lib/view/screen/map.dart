import 'dart:async';

import 'package:hgp/core/constant/color.dart';
import 'package:hgp/core/constant/routes.dart';
import 'package:hgp/view/screen/language/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hgp/view/widget/auth/loginauth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends GetView {
  const MapScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();
    late GoogleMapController mapController;

    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(35.19687640883001, -0.5968786432391258),
      zoom: 8,
    );
    GoogleMapController _googleMapController;

    Set<Marker> mymarker = {
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(34.88838592683149, -1.3161813964287314),
        infoWindow: InfoWindow(
          title: "FEKAR FAYCAL",
          onTap: () {
            launch('tel:+213550221011');
          },
          snippet: "0550 22 10 11",
        ),
      ),
      Marker(
        markerId: MarkerId("2"),
        position: LatLng(35.21378551776331, -0.631084495002868),
        infoWindow: InfoWindow(
            title: "FEKAIR",
            onTap: () {
              launch("tel:+213770958543");
            },
            snippet: "0770 95 85 43"),
      ),
      Marker(
        markerId: MarkerId("3"),
        position: LatLng(35.702056386025376, -0.6344205583743827),
        infoWindow: InfoWindow(
            title: "BOUALI ADNANE",
            onTap: () {
              launch("tel:+213561666763");
            },
            snippet: "0561 66 67 63"),
      ),
      Marker(
        markerId: MarkerId("4"),
        position: LatLng(35.72154494997155, -0.5672567167536288),
        infoWindow: InfoWindow(
            title: "FEKAIR",
            onTap: () {
              launch("tel:+213770958543");
            },
            snippet: "0770 95 85 43"),
      ),
      Marker(
        markerId: MarkerId("5"),
        position: LatLng(35.785426537761055, -0.42374169993655003),
        infoWindow: InfoWindow(
            title: "HADAOUI TAYEB",
            onTap: () {
              launch("tel:+213770323785");
            },
            snippet: "0770 32 37 85"),
      ),
      Marker(
        markerId: MarkerId("6"),
        position: LatLng(35.40626838210887, 0.14088035045684713),
        infoWindow: InfoWindow(
            title: "REDOUANE MEZIANE",
            onTap: () {
              launch("tel:+213791222514");
            },
            snippet: "0791 22 25 14"),
      ),
      Marker(
        markerId: MarkerId("7"),
        position: LatLng(36.737391217087456, 2.9292851909517252),
        infoWindow: InfoWindow(
            title: "EURL HABIDIS",
            onTap: () {
              launch("tel:+213770161462");
            },
            snippet: "0770 16 14 62"),
      ),
      Marker(
        markerId: MarkerId("8"),
        position: LatLng(36.759179504453414, 3.059884014690065),
        infoWindow: InfoWindow(
            title: "SOLTANI KHALED",
            onTap: () {
              launch("tel:+213561742830");
            },
            snippet: "0561 74 28 30"),
      ),
    };

    return Scaffold(
        body: Column(
      children: [
        //AIzaSyB6sERVsDDWCBRViVaPxkj__-nyMTjbmI0
        Container(
          width: Get.width,
          height: Get.height,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: GoogleMap(
            markers: mymarker,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

              _googleMapController = controller;
              _googleMapController.showMarkerInfoWindow(const MarkerId("1"));
              _googleMapController.showMarkerInfoWindow(const MarkerId("2"));
              _googleMapController.showMarkerInfoWindow(const MarkerId("3"));
              _googleMapController.showMarkerInfoWindow(const MarkerId("4"));
              _googleMapController.showMarkerInfoWindow(const MarkerId("5"));
              _googleMapController.showMarkerInfoWindow(const MarkerId("6"));
              _googleMapController.showMarkerInfoWindow(const MarkerId("7"));
              _googleMapController.showMarkerInfoWindow(const MarkerId("8"));
            },
          ),
        )
      ],
    ));
  }
}
