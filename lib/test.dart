import 'package:hgp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
