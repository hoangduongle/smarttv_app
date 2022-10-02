import 'package:smarttv_app/app/core/model/overview_content.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';

abstract class Repository {
  Future<List<OverviewContent>> getListOverview();
  Future<List<ServiceCategoryContent>> getListServiceCate();
}
