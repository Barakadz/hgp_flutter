import 'package:hgp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextSignUp extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;

  const CustomTextSignUp({
    Key? key,
    required this.textone,
    required this.texttwo,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(textone,
          style: TextStyle(color: AppColor.greyy, fontWeight: FontWeight.bold)),
      InkWell(
        onTap: onTap,
        child: Text(
          texttwo,
          style: TextStyle(
              color: AppColor.primaryColor, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
