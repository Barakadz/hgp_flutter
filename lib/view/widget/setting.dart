import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customListTile extends StatelessWidget {
  final icon;
  final String text;
  final void Function() onTap;
  final IconData? leadingIcon;

  const customListTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.leadingIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      onTap: onTap,
      trailing: Icon(icon),
      title: Text(text),
      leading: leadingIcon != null ? Icon(leadingIcon) : null,

    ));
  }
}
