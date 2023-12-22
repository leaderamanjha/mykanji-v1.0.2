import 'package:mykanji/core/app_export.dart';
import 'package:mykanji/presentation/shopping_category_tab_container_page/models/shopping_category_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ShoppingCategoryTabContainerPage.
///
/// This class manages the state of the ShoppingCategoryTabContainerPage, including the
/// current shoppingCategoryTabContainerModelObj
class ShoppingCategoryTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ShoppingCategoryTabContainerController(
      this.shoppingCategoryTabContainerModelObj);

  Rx<ShoppingCategoryTabContainerModel> shoppingCategoryTabContainerModelObj;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
