import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/presentation/shopping_category_page/models/shopping_category_model.dart';
import 'package:flutter/material.dart';
import 'package:mykanji/data/models/authCategoryGetAll/get_auth_category_get_all_resp.dart';
import 'package:mykanji/data/apiClient/api_client.dart';
import '../models/productgrid_item_model.dart';

/// A controller class for the ShoppingCategoryPage.
///
/// This class manages the state of the ShoppingCategoryPage, including the
/// current shoppingCategoryModelObj
class ShoppingCategoryController extends GetxController {
  ShoppingCategoryController(this.shoppingCategoryModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<ShoppingCategoryModel> shoppingCategoryModelObj;

  GetAuthCategoryGetAllResp getAuthCategoryGetAllResp =
      GetAuthCategoryGetAllResp();

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  /// Calls the https://dull-jade-drill-tutu.cyclic.app/auth/category-getall API with the specified request data.
  ///
  /// The [Map] parameter represents request body
  Future<void> callAuthCategoryGetAll() async {
    try {
      getAuthCategoryGetAllResp =
          await Get.find<ApiClient>().authCategoryGetAll(headers: {
        'Content-type': 'application/json',
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6ImRlYnVAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MDMwNTMwOTksImV4cCI6MTcwMzA1NjY5OX0.zsPgbSWK9CcZwnJQnvV3SeLviHYnS27_dDbikCT2xU0',
      });
      _handleAuthCategoryGetAllSuccess();
    } on GetAuthCategoryGetAllResp catch (e) {
      getAuthCategoryGetAllResp = e;
      rethrow;
    }
  }

  /// handles the success response for the API
  void _handleAuthCategoryGetAllSuccess() {
    var productgridItemModelList = <ProductgridItemModel>[];
    for (var element in getAuthCategoryGetAllResp.data ?? []) {
      var productgridItemModel = ProductgridItemModel();
      productgridItemModel.title?.value = element.categoryName ?? '';
      productgridItemModel.image?.value = element.image ?? '';
      productgridItemModel.subhead?.value = element.sV ?? 0;
      productgridItemModelList.add(productgridItemModel);
    }
    shoppingCategoryModelObj.value.productgridItemList.value =
        productgridItemModelList;
  }

  /// calls the [https://dull-jade-drill-tutu.cyclic.app/auth/category-getall] API
  ///
  /// It has [GetAuthCategoryGetAllReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onAuthCategoryGetAllSuccess()` function.
  /// If the call fails, the function calls the `_onAuthCategoryGetAllError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  @override
  Future<void> onReady() async {
    try {
      await callAuthCategoryGetAll();
      _onAuthCategoryGetAllSuccess();
    } on GetAuthCategoryGetAllResp {
      _onAuthCategoryGetAllError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _onAuthCategoryGetAllSuccess() {}

  /// Displays an alert dialog when the action is triggered.
  /// The dialog box contains a title and a message with the `Data is empty`
  void _onAuthCategoryGetAllError() {
    Get.defaultDialog(
        onConfirm: () => Get.back(),
        title: "NoData",
        middleText: "Data is empty");
  }
}
