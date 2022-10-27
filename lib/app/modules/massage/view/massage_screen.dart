import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/modules/massage/controller/massage_controller.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class MassageScreen extends GetView<MassageController> {
  const MassageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleScreen(
              name: "Massage thư giản",
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(top: 20.h, left: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 555.w,
                              height: 200.h,
                              decoration: BoxDecoration(
                                  color: AppColors.navigabackground,
                                  borderRadius: BorderRadius.circular(5.r)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5.r),
                                    child: Image.network(
                                      "https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg",
                                      width: 200.w,
                                      height: 150.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.h, horizontal: 10.w),
                                    width: 340.w,
                                    height: 180.h,
                                    child: Column(
                                      children: [
                                        Text(
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.normal,
                                                color: AppColors.white),
                                            "Đa số chúng ta việc văn phòng 8 tiếng một ngày thường dễ gặp tình trạng đau nhức và căng cơ vùng vai, gáy, lưng, bắp tay, bắp chân… do ngồi quá nhiều, ít vận động. Thêm vào đó, công việc căng thẳng khiến tâm trạng dễ bị stress, trở nên thất thường, mệt mỏi hoặc nóng nảy. "),
                                        SizedBox(
                                          height: 14.h,
                                        ),
                                        Text(
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.normal,
                                                color: AppColors.white),
                                            "Do đó 5 Men Hotel chúng tôi mang đến cho quý khách dịch vụ massage thư giản để nhằm giúp quý khách có được một kỳ nghĩ trọn vẹn cũng như khôi phục lại tinh thần sau những tháng ngày làm việc căng thẳng, mệt mỏi."),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Giờ làm việc",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.title),
                                  ),
                                  Container(
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: AppColors.title, width: 1.w),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "8:00 - 20:00",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.white),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    "Các loại massage",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.title),
                                  ),
                                  Container(
                                    width: 120.w,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: AppColors.title, width: 1.w),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "1. Massage thư giản ",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.white),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "2. Massage giảm đau nhức",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.white),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "3. Massage tinh dầu",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "Tác dụng của massage tới sức khỏe",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.title),
                        ),
                        Container(
                          width: 300.w,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: AppColors.title, width: 1.w),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10.sp,
                                color: AppColors.greyColor,
                              ),
                              SizedBox(
                                width: 700.w,
                                child: Text(
                                  "Giảm tình trạng căng cơ: Khi chúng ta bị tình trạng căng cơ xảy ra thường xuyên sẽ làm chậm sự lưu thông máu ở những vùng căng cơ. Massage có thể làm giúp thư giãn cũng như làm săn chắc cơ bắp.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.greyColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10.sp,
                                color: AppColors.greyColor,
                              ),
                              SizedBox(
                                width: 700.w,
                                child: Text(
                                  "Tăng cường tuần hoàn máu: Lượng ôxy trong máu có thể tăng 10 – 20% sau khi cơ thể được massage. Điều này có nghĩa là máu vận chuyển trong toàn cơ thể và nhất là trong các cơ quan nội tạng cao.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.greyColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10.sp,
                                color: AppColors.greyColor,
                              ),
                              SizedBox(
                                width: 700.w,
                                child: Text(
                                  "Giảm đáng kể tình trạng tăng xông đối với những bệnh cao huyết áp.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.greyColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10.sp,
                                color: AppColors.greyColor,
                              ),
                              SizedBox(
                                width: 700.w,
                                child: Text(
                                  "Thư giãn, săn chắc cơ, tăng lượng Endorphins có lợi trong cơ thể, làm săn chắc da.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.greyColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10.sp,
                                color: AppColors.greyColor,
                              ),
                              SizedBox(
                                width: 700.w,
                                child: Text(
                                  "Tăng cường khả năng miễn dịch và khả năng phục hồi sức khoẻ sau khi phẫu thuật.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.greyColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
