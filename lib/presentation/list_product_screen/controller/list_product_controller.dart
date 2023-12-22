import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/presentation/list_product_screen/models/list_product_model.dart';
import 'package:flutter/material.dart';
import 'package:mykanji/data/models/getAuthProductsGetAll/get_get_auth_products_get_all_resp.dart';
import 'package:mykanji/data/apiClient/api_client.dart';
import '../models/stackedcard_item_model.dart';

/// A controller class for the ListProductScreen.
///
/// This class manages the state of the ListProductScreen, including the
/// current listProductModelObj
class ListProductController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<ListProductModel> listProductModelObj = ListProductModel().obs;

  GetGetAuthProductsGetAllResp getGetAuthProductsGetAllResp =
      GetGetAuthProductsGetAllResp();

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  /// Calls the https://dull-jade-drill-tutu.cyclic.app/auth/products-getall API with the specified request data.
  ///
  /// The [Map] parameter represents request body
  Future<void> callGetAuthProductsGetAll() async {
    try {
      getGetAuthProductsGetAllResp =
          await Get.find<ApiClient>().getAuthProductsGetAll(headers: {
        'Content-type': 'application/json',
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6ImRlYnVAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MDMwNTMwOTksImV4cCI6MTcwMzA1NjY5OX0.zsPgbSWK9CcZwnJQnvV3SeLviHYnS27_dDbikCT2xU0',
      });
      _handleGetAuthProductsGetAllSuccess();
    } on GetGetAuthProductsGetAllResp catch (e) {
      getGetAuthProductsGetAllResp = e;
      rethrow;
    }
  }

  /// handles the success response for the API
  void _handleGetAuthProductsGetAllSuccess() {
    var stackedcardItemModelList = <StackedcardItemModel>[];
    for (var element in getGetAuthProductsGetAllResp.data ?? []) {
      var stackedcardItemModel = StackedcardItemModel();
      stackedcardItemModel.subheadText?.value = element.productPrice ?? 0;
      stackedcardItemModel.titleText?.value = element.productsName ?? '';
      stackedcardItemModel.sareeImage?.value = element.productImage ?? '';
      stackedcardItemModelList.add(stackedcardItemModel);
    }
    listProductModelObj.value.stackedcardItemList.value =
        stackedcardItemModelList;
  }

  /// calls the [https://dull-jade-drill-tutu.cyclic.app/auth/products-getall] API
  ///
  /// It has [GetGetAuthProductsGetAllReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onGetAuthProductsGetAllSuccess()` function.
  /// If the call fails, the function calls the `_onGetAuthProductsGetAllError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  @override
  Future<void> onReady() async {
    try {
      await callGetAuthProductsGetAll();
      _onGetAuthProductsGetAllSuccess();
    } on GetGetAuthProductsGetAllResp {
      _onGetAuthProductsGetAllError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _onGetAuthProductsGetAllSuccess() {}
  void _onGetAuthProductsGetAllError() {}
}
