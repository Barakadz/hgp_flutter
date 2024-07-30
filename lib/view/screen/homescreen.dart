import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hgp/controller/auth/homescreen_controller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/view/widget/auth/loginauth.dart';
import 'package:hgp/view/widget/home/custtombuttonappbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                hoverColor: AppColor.primaryColor,
                focusColor: AppColor.grey,
                backgroundColor: Colors.white,
                onPressed: () {},
                child: Image.asset(
                  "assets/images/logo-hgp.png",
                  width: 100,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                  color: Colors.white,
                  shape: CircularNotchedRectangle(),
                  notchMargin: 10,
                  child: Row(
                    children: [
                      ...List.generate(controller.listpage.length + 1, (index) {
                        int i = index > 2 ? index - 1 : index;
                        return index == 2
                            ? const Spacer()
                            : CustomButtonAppBar(
                                textbutton: controller.titlebottomappbar[i],
                                icondata: index == 0
                                    ? Icons.home_outlined
                                    : index == 1
                                        ? Icons.calculate_outlined
                                        : index == 3
                                            ? Icons.location_on_outlined
                                            : Icons.settings_outlined,
                                onPressed: () {
                                  controller.changePage(i);
                                },
                                active:
                                    controller.currentPage == i ? true : false);
                      })
                    ],
                  )),
              body: controller.listpage.elementAt(controller.currentPage),
            ));
  }
}
