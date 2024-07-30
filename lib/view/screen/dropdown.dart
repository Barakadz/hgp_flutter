import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/view/screen/dropdown_getx.dart';

class MyDropdownMenu extends StatelessWidget {
  final DropdownController controller = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Menu'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColor.primaryColor)),
            child: Obx(() => DropdownButton<String>(
                  borderRadius: BorderRadius.circular(15),
                  padding: EdgeInsets.all(10),
                  isExpanded: true,
                  underline: SizedBox(),
                  value: controller.selectedValue.value,
                  items: <String>['mur normale', 'mur cloison', 'mur ', '', '']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.setSelectedValue(newValue);
                    }
                  },
                )),
          ),
          SizedBox(height: 20),
          Obx(() => Text('Selected value: ${controller.selectedValue.value}')),
        ],
      ),
    );
  }
}
