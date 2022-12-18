// ignore_for_file: unused_import, constant_identifier_names

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
const roomId = 8;
const bookId = "bookingId";

const userNameApi = '123';
const passwordApi = '123';
const urlApi = 'https://hotelservice-v5.herokuapp.com/api/v1/login?';

DeviceContent device = DeviceContent(
    id: 3,
    partNumber: "PART003",
    serialNo: "SERIAL003",
    name: "Sony 43",
    brand: "Sony",
    description: "TV Sony",
    status: true,
    room: null);

const List<NavigationContent> listNavigationContent = [
  NavigationContent(
      title: 'home',
      iconData: FluentIcons.home_24_regular,
      iconSelectedData: FluentIcons.home_24_filled),
  NavigationContent(
      title: 'services',
      iconData: FluentIcons.service_bell_24_regular,
      iconSelectedData: FluentIcons.service_bell_24_filled),
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
