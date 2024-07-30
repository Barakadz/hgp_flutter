import 'package:hgp/core/constant/color.dart';
import 'package:hgp/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtomAuth({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      splashColor: AppColor.grey,
      child: Text(text, style: TextStyle(fontSize: 16)),
      color: AppColor.primaryColor,
      textColor: Colors.white,
      padding: EdgeInsets.all(20),
    );
  }
}
