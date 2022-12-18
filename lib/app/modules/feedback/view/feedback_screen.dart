// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/feedback/controller/feedback_controller.dart';
import 'package:smarttv_app/app/modules/feedback/models/radioButton.dart';
import 'package:smarttv_app/app/modules/feedback/widget/title.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedbackController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: AppColors.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleScreen(name: "Đánh giá"),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            SizedBox(
                                height: 210.h,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: TitleFeedback(
                                              name: "Dịch vụ",
                                              isBig: true,
                                            ),
                                          ),
                                          for (int i = 0; i < 4; i++)
                                            controller
                                                    .listFeedback.value.isEmpty
                                                ? Container()
                                                : Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5.h),
                                                    child: SizedBox(
                                                      height: 30.h,
                                                      child: TitleFeedback(
                                                        name:
                                                            "${controller.listFeedback.value[i].content}",
                                                      ),
                                                    ),
                                                  ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          rate(),
                                          radio(controller, 0),
                                          radio(controller, 1),
                                          radio(controller, 2),
                                          radio(controller, 3),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                                height: 210.h,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10.h),
                                            child: TitleFeedback(
                                              name: "Phòng",
                                              isBig: true,
                                            ),
                                          ),
                                          for (int i = 4; i < 8; i++)
                                            controller
                                                    .listFeedback.value.isEmpty
                                                ? Container()
                                                : Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5.h),
                                                    child: SizedBox(
                                                      height: 30.h,
                                                      child: TitleFeedback(
                                                        name:
                                                            "${controller.listFeedback.value[i].content}",
                                                      ),
                                                    ),
                                                  ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        children: [
                                          rate(),
                                          radio(controller, 4),
                                          radio(controller, 5),
                                          radio(controller, 6),
                                          radio(controller, 7),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: 100.w,
                              height: 40.h,
                              child: Material(
                                color: AppColors.focus,
                                borderRadius: BorderRadius.circular(10.r),
                                child: InkWell(
                                  focusColor: AppColors.orangeColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                  onTap: () {
                                    controller.updateFeedback();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Gửi đánh giá',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                            color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding radio(FeedbackController controller, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
          height: 30.h,
          decoration: BoxDecoration(
              color: AppColors.navigabackground,
              borderRadius: BorderRadius.circular(10.r)),
          child: ListRadio(controller: controller, index: index)),
    );
  }

  Padding rate() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(left: 25.w),
            width: 25.w,
            child: TitleFeedback(
              name: "Tệ",
            ),
          ),
          TitleFeedback(
            name: "Không hài lòng",
          ),
          TitleFeedback(
            name: "Bình thường",
          ),
          TitleFeedback(
            name: "Hài lòng",
          ),
          TitleFeedback(
            name: "Rất hài lòng",
          ),
        ],
      ),
    );
  }
}

class Radiooo extends StatelessWidget {
  FeedbackController controller;
  int index;
  FeedbackState value;
  Radiooo({
    Key? key,
    required this.controller,
    required this.index,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .8,
      child: Radio(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        focusColor: AppColors.greyColor,
        fillColor: MaterialStateProperty.all<Color>(AppColors.title),
        value: value,
        groupValue: controller.list[index],
        onChanged: (FeedbackState? value) {
          controller.list[index] = value!;
        },
      ),
    );
  }
}

class ListRadio extends StatelessWidget {
  FeedbackController controller;
  int index;
  ListRadio({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Radiooo(
            controller: controller,
            index: index,
            value: FeedbackState.verySatisfied),
        Radiooo(
            controller: controller,
            index: index,
            value: FeedbackState.satisfied),
        Radiooo(
            controller: controller, index: index, value: FeedbackState.normal),
        Radiooo(
            controller: controller,
            index: index,
            value: FeedbackState.notSatisfied),
        Radiooo(controller: controller, index: index, value: FeedbackState.bad),
      ],
    );
  }
}
