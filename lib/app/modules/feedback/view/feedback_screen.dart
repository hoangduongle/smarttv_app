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
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    "Đánh giá của quý khách sẽ được lưu lại khi thực hiện chech-out",
                    style: TextStyle(
                        color: AppColors.orangeColor.withOpacity(0.8),
                        fontSize: 17.sp),
                  ),
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            SizedBox(
                                height: 200.h,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: TitleFeedback(
                                              name: "Dịch vụ",
                                              isBig: true,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: SizedBox(
                                              height: 30.h,
                                              child: TitleFeedback(
                                                name: "Lễ tân",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: SizedBox(
                                              height: 30.h,
                                              child: TitleFeedback(
                                                name: "Thức ăn và đồ uống",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: SizedBox(
                                              height: 30.h,
                                              child: TitleFeedback(
                                                name: "Đưa đón sân bay",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: SizedBox(
                                              height: 30.h,
                                              child: TitleFeedback(
                                                name: "Massage",
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
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                TitleFeedback(
                                                  name: "Rất hài lòng",
                                                ),
                                                TitleFeedback(
                                                  name: "Hài lòng",
                                                ),
                                                TitleFeedback(
                                                  name: "Bình thường",
                                                ),
                                                TitleFeedback(
                                                  name: "Không hài lòng",
                                                ),
                                                SizedBox(
                                                  width: 45.w,
                                                  child: TitleFeedback(
                                                    name: "Tệ",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: Container(
                                                height: 30.h,
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .navigabackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r)),
                                                child: ListRadio(
                                                    controller: controller,
                                                    index: 0)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: Container(
                                                height: 30.h,
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .navigabackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r)),
                                                child: ListRadio(
                                                    controller: controller,
                                                    index: 1)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: Container(
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                  color: AppColors
                                                      .navigabackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                              child: ListRadio(
                                                  controller: controller,
                                                  index: 2),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: Container(
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                  color: AppColors
                                                      .navigabackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                              child: ListRadio(
                                                  controller: controller,
                                                  index: 3),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                                height: 235.h,
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
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: SizedBox(
                                              height: 30.h,
                                              child: TitleFeedback(
                                                name: "Trang trí",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: SizedBox(
                                              height: 30.h,
                                              child: TitleFeedback(
                                                name: "Vệ sinh",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: SizedBox(
                                              height: 30.h,
                                              child: TitleFeedback(
                                                name: "Tiện ích",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: SizedBox(
                                              height: 30.h,
                                              child: TitleFeedback(
                                                name: "Điều hoà",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: SizedBox(
                                              height: 30.h,
                                              child: TitleFeedback(
                                                name: "Giường",
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
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                TitleFeedback(
                                                  name: "Rất hài lòng",
                                                ),
                                                TitleFeedback(
                                                  name: "Hài lòng",
                                                ),
                                                TitleFeedback(
                                                  name: "Bình thường",
                                                ),
                                                TitleFeedback(
                                                  name: "Không hài lòng",
                                                ),
                                                SizedBox(
                                                  width: 45.w,
                                                  child: TitleFeedback(
                                                    name: "Tệ",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: Container(
                                                height: 30.h,
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .navigabackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r)),
                                                child: ListRadio(
                                                    controller: controller,
                                                    index: 4)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: Container(
                                                height: 30.h,
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .navigabackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r)),
                                                child: ListRadio(
                                                    controller: controller,
                                                    index: 5)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: Container(
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                  color: AppColors
                                                      .navigabackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                              child: ListRadio(
                                                  controller: controller,
                                                  index: 6),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: Container(
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                  color: AppColors
                                                      .navigabackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                              child: ListRadio(
                                                  controller: controller,
                                                  index: 7),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: Container(
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                  color: AppColors
                                                      .navigabackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                              child: ListRadio(
                                                  controller: controller,
                                                  index: 8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ))),
              ],
            ),
          ),
        );
      },
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
