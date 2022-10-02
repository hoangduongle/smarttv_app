import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/page_state.dart';

abstract class BaseController extends GetxController {
  final _refreshController = false.obs;

  refreshPage(bool refresh) => _refreshController(refresh);

  final _pageSateController = PageState.DEFAULT.obs;

  PageState get pageState => _pageSateController.value;
  bool get isLoading => pageState == PageState.LOADING;

  updatePageState(PageState state) => _pageSateController(state);

  resetPageState() => _pageSateController(PageState.DEFAULT);

  showLoading() => updatePageState(PageState.LOADING);

  hideLoading() => resetPageState();

  Future<dynamic> callDataService<T>(
    Future<T> future, {
    Function(DioError dioError)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  }) async {
    DioError? dioError;

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;
    } on DioError catch (error) {
      dioError = error;
    } catch (error) {
      debugPrint('API Parse Error: $error');
      rethrow;
    }

    if (onError != null) onError(dioError);

    onComplete == null ? hideLoading() : onComplete();
  }
  @override
  void onClose() {
    _refreshController.close();
    _pageSateController.close();
    super.onClose();
  }
}
