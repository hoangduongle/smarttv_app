// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';

import 'package:smarttv_app/app/modules/service_components/controller/cart_dialog_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class DialogWidget extends StatelessWidget {
  int index;
  DialogWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showCustomeDialog(BuildContext context, int componentId) {
    CartController caController = Get.find(tag: CartController().toString());
    CartdialogController controller = Get.find();
    controller.count = 1.obs;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: AppColors.navigabackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                width: 200,
                margin: EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: NetworkImage(
                        'https://www.pixelstalk.net/wp-content/uploads/2016/07/1080p-Full-HD-Images.jpg'), //<------ set controllr
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Name $index", //<------ set controller
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.title),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      splashRadius: 12,
                      color: AppColors.white,
                      onPressed: () {
                        controller.decrement();
                      },
                      icon: Icon(Icons.remove_circle),
                      focusColor: AppColors.focus),
                  Obx(
                    () => Text(controller.count.toString(),
                        style: TextStyle(color: AppColors.white)),
                  ),
                  IconButton(
                      autofocus: true,
                      color: AppColors.white,
                      splashRadius: 12,
                      onPressed: () {
                        controller.increment();
                      },
                      icon: Icon(Icons.add_circle),
                      focusColor: AppColors.focus)
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(color: AppColors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        if (controller.count.toInt() > 0) {
                          
                          // caController.addService(serviceContent);
                          Get.back();
                        } else {
                          Get.back();
                        }
                      },
                      child: Text(
                        "Add",
                        style: TextStyle(color: AppColors.focus),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
