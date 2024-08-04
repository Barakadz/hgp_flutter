import 'package:hgp/controller/onboarding.conroller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormAuth extends GetView<OnBoardingControllerImp> {
  final String hintText;
  final String labelText;
  final IconData? iconData;
  //? = 9ader ye9bel null variable mycontroller
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  // bach fel input téléphone clavier yokhroje number
  final bool isNumber;
  // bach fel input password-- text lazem yokhroj secure
  final bool? obsucureText;

  final String? sufixtext;
  final void Function(String)? onChanged;

  const CustomTextFormAuth({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isNumber,
    this.obsucureText,
    this.sufixtext,
        this.onChanged,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: isNumber
            //ida kan isNumber == true
            ? const TextInputType.numberWithOptions(decimal: true)
            //ida kan inNumber == false
            : TextInputType.text,
        validator: valid,
        onChanged: onChanged,
        cursorColor: AppColor.primaryColor,
        controller: mycontroller,
        obscureText: obsucureText == null ? false : true,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          hintText: hintText,
          suffixText: sufixtext,
          hintStyle: const TextStyle(fontSize: 14),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColor.primaryColor)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
        ),
      ),
    );
  }
}
