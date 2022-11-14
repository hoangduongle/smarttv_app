// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, must_be_immutable, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';
import 'package:smarttv_app/app/modules/order/widget/listorder.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class ListOrderScreen extends StatefulWidget {
  const ListOrderScreen({super.key});

  @override
  State<ListOrderScreen> createState() => _ListOrderScreenState();
}

class _ListOrderScreenState extends State<ListOrderScreen> {
  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    ScrollController scrollOrderController = ScrollController();
    return GetBuilder<OrderController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: AppColors.background,
            child: Column(
              children: [
                TitleScreen(
                  name: "Hoá đơn",
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'STT.'.tr,
                      style: AppStyles.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.title,
                      ),
                    ),
                    Text('Mã hoá đơn'.tr,
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                    Text('Tổng tiền'.tr,
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                    Text('Ngày',
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                    Text('Trạng thái'.tr,
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                // controller.orders.value.isEmpty
                //     ? Expanded(
                //         child: Lottie.asset("assets/lotties/loading.json",
                //             width: 200.w))
                //     :
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: SizedBox(
                    width: 900.w,
                    height: 380.h,
                    child: RawScrollbar(
                      thumbColor: AppColors.greyColor,
                      thumbVisibility: true,
                      radius: Radius.circular(100.r),
                      thickness: 10,
                      controller: scrollOrderController,
                      child: ListView.separated(
                          controller: scrollOrderController,
                          separatorBuilder: (context, index) => SizedBox(
                                height: 25.h,
                              ),
                          itemCount: controller.orders.value.length,
                          itemBuilder: (context, index) {
                            return ListOrder(
                                orderController: controller,
                                orderContent: controller.orders.value[index],
                                index: index);
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
