// ignore_for_file: unused_element, unused_local_variable

import 'package:smarttv_app/app/core/base/base_repository.dart';
import 'package:smarttv_app/app/data/dio/dio_provider.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/core/model/overview_content.dart';

class RepositoryImpl extends BaseRepository implements Repository {
  @override
  Future<List<OverviewContent>> getListOverview() {
    var endpoint = "${DioProvider.baseUrl}/overview/getOverviewServices";
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        var result = <OverviewContent>[];

        for (var element in (response.data as List<dynamic>)) {
          result.add(OverviewContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ServiceCategoryContent>> getListServiceCate() {
    var endpoint = "${DioProvider.baseUrl}/serviceCategories";
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        var result = <ServiceCategoryContent>[];

        for (var element in (response.data as List<dynamic>)) {
          result.add(ServiceCategoryContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }
}
