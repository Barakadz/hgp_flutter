import 'package:flutter/material.dart';
import 'package:get/get.dart';

customBottomSheet(titre, icons) {
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
              Text(titre),
              IconButton(
                icon: Icon(icons),
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
}
