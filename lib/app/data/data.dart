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
const roomId = 4;
const bookId = "bookingId";
const departualDateBooking = "DepartualDateBooking";

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

const mapboxUrlTemplate =
    'https://api.mapbox.com/styles/v1/lehhoangduong/cl9xnm59q00j714o2ltpm3mdp/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibGVoaG9hbmdkdW9uZyIsImEiOiJjbDl4cGExdjkwMjFuM25xcW00eXI2aXVmIn0.KIUtgALNKjfp1fWry_3vwQ';
const mapboxAccessToken =
    'pk.eyJ1IjoibGVoaG9hbmdkdW9uZyIsImEiOiJjbDl4cGExdjkwMjFuM25xcW00eXI2aXVmIn0.KIUtgALNKjfp1fWry_3vwQ';
const mapboxId = 'mapbox.mapbox-streets-v8';

const SECONDS = 10;
const seconds_ServiceCate = 10;
const seconds_Event = 10;
const seconds_Promotion = 10;
const seconds_News = 10;
const seconds_Orders = 10;

const urlLoadingImage =
    'https://www.vuescript.com/wp-content/uploads/2018/11/Show-Loader-During-Image-Loading-vue-load-image.png';

const wellcomeAbtraction = 'https://i.ibb.co/L69PWnr/local.png';
const wellcomeNews = 'https://i.ibb.co/F3FN8vx/promotion.png';
const wellcomeHomePage =
    'https://www.saigonprincehotel.com/files/images/page/1/tmiads.vn-entrance-home-1538966188.jpg';
const wellcomeService =
    'https://www.evenement.com/wp-content/uploads/2022/08/restaurant-interior-758x534.jpg';
const wellcomeEvent =
    'https://seaevent.vn/wp-content/uploads/2019/12/welcome-to-sea-event-banner.jpg';

const BOOKED = 'BOOKED';
const DONE = 'DONE';
const TURNDOWN = 'TURN DOWN';

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
