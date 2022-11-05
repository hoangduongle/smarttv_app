// ignore_for_file: unused_import

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:smarttv_app/app/core/model/device_content.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/model/navigator_content.dart';
import 'package:smarttv_app/app/core/model/overview_content.dart';
import 'package:smarttv_app/app/core/model/room_content.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_const.dart';

const hotelId = 1;

RoomContent roomContent = RoomContent(
  id: 11,
  name: "R011",
  roomNo: "001",
  createBy: "Duong",
  createDate: "28/10/2022",
  description: "Phong Deluxe 001",
  hotelId: hotelId,
  lastModifyBy: "Long",
  roomTypeId: 3,
  updateDate: "28/10/2022",
);

DeviceContent device = DeviceContent(
    id: 3,
    partNumber: "PART003",
    serialNo: "SERIAL003",
    name: "Sony 43",
    brand: "Sony",
    description: "TV Sony",
    status: true,
    room: roomContent);

const List<NavigationContent> listNavigationContent = [
  NavigationContent(
      title: 'home',
      iconData: FluentIcons.home_24_regular,
      iconSelectedData: FluentIcons.home_24_filled),
  NavigationContent(
      title: 'services',
      iconData: FluentIcons.service_bell_24_regular,
      iconSelectedData: FluentIcons.service_bell_24_filled),
  // NavigationContent(title: 'cart', iconData: FluentIcons.cart_20_filled),
  NavigationContent(
      title: 'event',
      iconData: FluentIcons.calendar_checkmark_24_regular,
      iconSelectedData: FluentIcons.calendar_checkmark_24_filled),
  NavigationContent(
      title: 'abtraction',
      iconData: FluentIcons.location_24_regular,
      iconSelectedData: FluentIcons.location_24_filled),
  NavigationContent(
      title: 'Tin tức',
      iconData: FluentIcons.ticket_diagonal_16_regular,
      iconSelectedData: FluentIcons.ticket_diagonal_16_filled),
  NavigationContent(
      title: 'bill',
      iconData: FluentIcons.receipt_24_regular,
      iconSelectedData: FluentIcons.receipt_24_filled),
  NavigationContent(
      title: 'Đánh giá',
      iconData: FluentIcons.person_feedback_16_regular,
      iconSelectedData: FluentIcons.person_feedback_16_filled),
];

const List<ImageContent> imageListServiceCategories = [];
const List<ImageContent> imageListServices = [];
const List<ImageContent> imageListEvent = [];
const List<ImageContent> imageListPromotion = [];

// const List<OverviewContent> listOverviewContent = [
//   OverviewContent(
//       title: AppConstants.title,
//       imageUrl: AppAssets.overview_hotel,
//       description: '+ Khách sạn 5 sao chuẩn quốc tế'
//           '+ Hứa hẹn đem lại cho quý khách hàng trải nghiệm tốt nhất'
//           '+ Free bữa sáng - view hồ bơi - và một số sự kiện hấp dẫn đi kèm'),
//   OverviewContent(
//       title: 'Dịch vụ',
//       imageUrl: AppAssets.overview_service,
//       description:
//           '+ Hotel cung cấp cho quý khách hàng tất tần tật mọi loại dịch vụ'
//           '+ Sẵn sáng đáp ứng yêu cầu của quý khách 24/24'
//           '+ Đa dạng các dịch vụ như giặt ủi, thuê xe,...'),
//   OverviewContent(
//       title: 'Thức ăn',
//       imageUrl: AppAssets.overview_food,
//       description: '+ Thức ăn phong phú đến từ mọi miền của đất nước'
//           '+ Từ núi cao cho đến biển cả'
//           '+ Đặc biệt chỉ cần yêu cầu chúng tôi sẽ đáp ứng menu theo yêu cầu của bạn'),
//   OverviewContent(
//       title: 'Sự kiện',
//       imageUrl: AppAssets.overview_event,
//       description: '+ 5 Men Hotel - nơi hội tụ mọi cuộc chơi'
//           '+ Xung quanh hotel luôn có những sự kiện đình đám trong và ngoài nước'
//           '+ Colors me run - festival - sea party - concert'),
// ];