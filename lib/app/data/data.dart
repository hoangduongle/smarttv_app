// ignore_for_file: unused_import

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:smarttv_app/app/core/model/device_content.dart';
import 'package:smarttv_app/app/core/model/navigator_content.dart';
import 'package:smarttv_app/app/core/model/overview_content.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/values/app_assets.dart';
import 'package:smarttv_app/app/values/app_const.dart';

Device device = Device(
    id: "D001",
    roomId: "L001",
    deviceName: "TV",
    brand: "Sony",
    description: "42inh");

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
      title: 'local',
      iconData: FluentIcons.location_24_regular,
      iconSelectedData: FluentIcons.location_24_filled),
  NavigationContent(
      title: 'bill',
      iconData: FluentIcons.receipt_24_regular,
      iconSelectedData: FluentIcons.receipt_24_filled),
];

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

List<ServiceCategoryContent> listCateContent = [
  ServiceCategoryContent(
      id: "C001",
      name: "Thức Ăn",
      picture:
          "https://images.unsplash.com/photo-1551573355-19727699d60a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      description: "aaaaa"),
  ServiceCategoryContent(
      id: "C002",
      name: "Thức Uống",
      picture:
          "https://images.unsplash.com/photo-1551509134-2f9d4ec80a9b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      description: "aaaaa"),
  ServiceCategoryContent(
      id: "C003",
      name: "Giặt Ủi",
      picture:
          "https://images.unsplash.com/photo-1553152531-b98a2fc8d3bf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
      description: "aaaaa"),
  ServiceCategoryContent(
      id: "C004",
      name: "Thuê Xe",
      picture:
          "https://images.unsplash.com/photo-1552752399-22aa8f97ade0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      description: "aaaaa"),
];

// const List<ServiceContent> listServiceContent = [
//   ServiceContent(
//       id: "S001",
//       name: "Beefsteak",
//       picture: "assets/images/services/insides/beefsteak.jpg",
//       price: 100.0,
//       description: "Món ăn này ngon lắm",
//       serviceProviderId: "SP001",
//       categoryId: "C001",
//       status: true),
//   ServiceContent(
//       id: "S002",
//       name: "Mỳ Ý",
//       picture: "assets/images/services/insides/my_y.jpg",
//       price: 100.0,
//       description: "Món ăn này ngon lắm",
//       serviceProviderId: "SP001",
//       categoryId: "C001",
//       status: true),
//   ServiceContent(
//       id: "S003",
//       name: "Cơm Chiên",
//       picture: "assets/images/services/insides/com_chien.jpg",
//       price: 100.0,
//       description: "Món ăn này ngon lắm",
//       serviceProviderId: "SP001",
//       categoryId: "C001",
//       status: true),
//   ServiceContent(
//       id: "S004",
//       name: "Hủ Tiếu Nam Vang",
//       picture: "assets/images/services/insides/hu_tieu_nam_vang.jpg",
//       price: 100.0,
//       description: "Món ăn này ngon lắm",
//       serviceProviderId: "SP001",
//       categoryId: "C001",
//       status: true),
//   ServiceContent(
//       id: "S005",
//       name: "Nem Nướng",
//       picture: "assets/images/services/insides/nem_nuong.jpg",
//       price: 100.0,
//       description: "Món ăn này ngon lắm",
//       serviceProviderId: "SP001",
//       categoryId: "C001",
//       status: true),
//   ServiceContent(
//       id: "S006",
//       name: "Phở",
//       picture: "assets/images/services/insides/pho.jpg",
//       price: 100.0,
//       description: "Món ăn này ngon lắm",
//       serviceProviderId: "SP001",
//       categoryId: "C001",
//       status: true),
//   ServiceContent(
//       id: "S007",
//       name: "Salad Ớt Chuông",
//       picture: "assets/images/services/insides/salad_ot_chuong.jpg",
//       price: 100.0,
//       description: "Món ăn này ngon lắm",
//       serviceProviderId: "SP001",
//       categoryId: "C001",
//       status: true),
//   ///////////////////////////////////
//   ServiceContent(
//       id: "S008",
//       name: "7 Up",
//       picture: "assets/images/services/insides/7up.jpg",
//       price: 10.0,
//       description: "Nước uống giải khát",
//       serviceProviderId: "SP001",
//       categoryId: "C002",
//       status: true),

//   ServiceContent(
//       id: "S009",
//       name: "Coca Cola",
//       picture: "assets/images/services/insides/coca.png",
//       price: 10.0,
//       description: "Nước uống giải khát",
//       serviceProviderId: "SP001",
//       categoryId: "C002",
//       status: true),

//   ServiceContent(
//       id: "S010",
//       name: "Mirinda Cam",
//       picture: "assets/images/services/insides/mirinda_cam.png",
//       price: 10.0,
//       description: "Nước uống giải khát",
//       serviceProviderId: "SP001",
//       categoryId: "C002",
//       status: true),

//   ServiceContent(
//       id: "S011",
//       name: "Mirida Đá Me",
//       picture: "assets/images/services/insides/mirinda_da_me.png",
//       price: 10.0,
//       description: "Nước uống giải khát",
//       serviceProviderId: "SP001",
//       categoryId: "C002",
//       status: true),

//   ServiceContent(
//       id: "S012",
//       name: "Mirinda Soda Kem",
//       picture: "assets/images/services/insides/mirinda_sodakem.png",
//       price: 10.0,
//       description: "Nước uống giải khát",
//       serviceProviderId: "SP001",
//       categoryId: "C002",
//       status: true),

//   ServiceContent(
//       id: "S013",
//       name: "Pepsi",
//       picture: "assets/images/services/insides/pepsi.png",
//       price: 10.0,
//       description: "Nước uống giải khát",
//       serviceProviderId: "SP001",
//       categoryId: "C002",
//       status: true),

//   ServiceContent(
//       id: "S014",
//       name: "Sprite",
//       picture: "assets/images/services/insides/sprite.png",
//       price: 10.0,
//       description: "Nước uống giải khát",
//       serviceProviderId: "SP001",
//       categoryId: "C002",
//       status: true),

//   ServiceContent(
//       id: "S015",
//       name: "Sting Vàng",
//       picture: "assets/images/services/insides/sting_vang.png",
//       price: 10.0,
//       description: "Nước uống giải khát",
//       serviceProviderId: "SP001",
//       categoryId: "C002",
//       status: true),

//   ServiceContent(
//       id: "S016",
//       name: "Sting Dâu",
//       picture: "assets/images/services/insides/string_dau.png",
//       price: 10.0,
//       description: "Nước uống giải khát",
//       serviceProviderId: "SP001",
//       categoryId: "C002",
//       status: true),

//   ServiceContent(
//       id: "S017",
//       name: "Warrior Dâu",
//       picture: "assets/images/services/insides/warrior_dau.jpg",
//       price: 10.0,
//       description: "Nước uống giải khát",
//       serviceProviderId: "SP001",
//       categoryId: "C002",
//       status: true),

//   ServiceContent(
//       id: "S018",
//       name: "Warrior Nho",
//       picture: "assets/images/services/insides/warrior_nho.jpg",
//       price: 10.0,
//       description: "Nước uống giải khát",
//       serviceProviderId: "SP001",
//       categoryId: "C002",
//       status: true),
//   /////////////////////////////////
//   ServiceContent(
//       id: "S019",
//       name: "Honda Wave",
//       picture: "assets/images/services/outsides/honda_wave.jpg",
//       price: 100.0,
//       description: "Xe này rẻ lắm",
//       serviceProviderId: "SP002",
//       categoryId: "C004",
//       status: true),
// ];
